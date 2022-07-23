//! Setups up the Aptosis faucet.
//!
//! # Usage
//!
//! Create the initialization scripts like so:
//!
//! ```bash
//! cargo run --bin setup
//! ```
//!
//! Then run `./scripts/init_tokens.sh`.
use anyhow::*;
use coinlist::{ChainID, CoinInfo, CoinList};
use move_core_types::{
    account_address::AccountAddress, ident_str, identifier::Identifier,
    language_storage::StructTag, parser::parse_struct_tag,
};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
use tera::Tera;
use url::Url;

/// Simplified Move manifest.
#[derive(Deserialize)]
pub struct MoveManifestSimple {
    pub addresses: BTreeMap<String, String>,
}

/// Test coin as defined in the configuration.
#[derive(Deserialize)]
pub struct DevCoin {
    pub name: String,
    pub decimals: u8,
}

#[derive(Serialize, Deserialize)]
pub struct DevCoinInfo {
    #[serde(flatten)]
    pub coin: CoinInfo,
    pub hard_cap: u64,
}

impl From<CoinInfo> for DevCoinInfo {
    fn from(coin: CoinInfo) -> Self {
        Self {
            hard_cap: 10_u64.pow(coin.decimals.into()) * 1_000_000_000,
            coin,
        }
    }
}

pub fn make_test_coin() -> Result<CoinInfo> {
    Ok(CoinInfo {
        name: "Aptos".to_string(),
        symbol: "APTOS".to_string(),
        logo_uri: Some("https://raw.githubusercontent.com/aptosis/aptosis-coin-list/master/assets/devnet/apt.svg".to_string().parse()?),
        decimals: 4,
        address: parse_struct_tag("0x1::TestCoin::TestCoin")?.into(),
        chain_id: ChainID::AptosDevnet as u32,
        tags: None,
        extensions: None,
    })
}

pub fn make_coin_info(
    address: &AccountAddress,
    symbol: &str,
    DevCoin { name, decimals }: &DevCoin,
) -> Result<CoinInfo> {
    Ok(CoinInfo {
        chain_id: coinlist::ChainID::AptosDevnet as u32,
        address: StructTag {
            address: *address,
            module: ident_str!("DevCoin").to_owned(),
            name: Identifier::new(symbol)?,
            type_params: vec![],
        }
        .into(),
        name: name.into(),
        symbol: symbol.into(),
        decimals: *decimals,
        extensions: None,
        logo_uri: Some(Url::parse(&format!(
            "https://raw.githubusercontent.com/aptosis/aptosis-coin-list/master/assets/devnet/{}.svg",
            symbol.to_lowercase()
        ))?),
        tags: Some(vec!["aptosis-faucet".into()]),
    })
}

pub fn generate_coin_list<'a, I>(address: &AccountAddress, coins: I) -> Result<CoinList>
where
    I: IntoIterator<Item = (&'a String, &'a DevCoin)>,
{
    let tokens = coins
        .into_iter()
        .map(|(symbol, token)| make_coin_info(address, symbol, token))
        .collect::<Result<Vec<_>>>()?;
    let mut coin_list = CoinList::new("Aptosis Coin List");
    coin_list.tokens = tokens;
    coin_list.tokens.insert(0, make_test_coin()?);
    Ok(coin_list)
}

pub struct Setup {
    pub tera: Tera,
    pub ctx: SetupContext,
}

impl Setup {
    pub fn init(
        addr: &AccountAddress,
        coin_list: &CoinList,
        aptosis_minter: AccountAddress,
    ) -> Result<Self> {
        let mut tera = Tera::default();
        tera.add_raw_template("dev_coin", include_str!("templates/dev_coin.tpl.move"))?;
        tera.add_raw_template("init_tokens", include_str!("templates/init_tokens.tpl.sh"))?;

        let coins = coin_list
            .tokens
            .iter()
            .filter(|coin| coin.symbol != "APTOS")
            .map(|coin| DevCoinInfo::from(coin.clone()))
            .collect::<Vec<_>>();

        let ctx = SetupContext {
            faucet_address: addr.to_hex_literal(),
            coins,
            aptosis_minter_address: aptosis_minter.short_str_lossless(),
        };
        Ok(Self { tera, ctx })
    }

    pub fn generate_move(&self) -> Result<String> {
        let result = self
            .tera
            .render("dev_coin", &tera::Context::from_serialize(&self.ctx)?)?;
        Ok(result)
    }

    pub fn generate_init_script(&self) -> Result<String> {
        let result = self
            .tera
            .render("init_tokens", &tera::Context::from_serialize(&self.ctx)?)?;
        Ok(result)
    }
}

#[derive(Serialize)]
pub struct SetupContext {
    /// Address of the faucet.
    pub faucet_address: String,
    pub coins: Vec<DevCoinInfo>,
    pub aptosis_minter_address: String,
}
