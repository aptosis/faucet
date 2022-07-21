//! Sets up the faucet coins.

use anyhow::*;
use aptos_cli_config::CliConfig;
use move_deps::move_core_types::account_address::AccountAddress;
use setup::{generate_coin_list, DevCoin, MoveManifestSimple, Setup};
use std::{collections::BTreeMap, os::unix::prelude::PermissionsExt};

fn main() -> Result<()> {
    std::fs::create_dir_all("generated")?;
    std::fs::create_dir_all("scripts")?;

    let config = CliConfig::load_profile("faucet")
        .with_context(|| "could not load config")?
        .expect("profile default not found");
    let addr = AccountAddress::new(
        config
            .account
            .expect("account not found in default profile")
            .into_bytes(),
    );

    let move_manifest_path =
        std::fs::read_to_string("Move.toml").with_context(|| "could not open Move.toml")?;
    let move_manifest: MoveManifestSimple = toml::from_str(&move_manifest_path)?;
    let aptosis_minter = AccountAddress::from_hex_literal(
        move_manifest
            .addresses
            .get("AptosisMinter")
            .expect("AptosisMinter address not specified in Move.toml"),
    )?;

    let tokens_file =
        std::fs::read_to_string("Coins.toml").with_context(|| "could not find Coins.toml")?;
    let tokens: BTreeMap<String, DevCoin> = toml::from_str(&tokens_file)?;

    let coin_list = generate_coin_list(&addr, &tokens)?;
    let setup = Setup::init(&addr, &coin_list, aptosis_minter)?;
    let move_str = setup.generate_move()?;
    let init_script = setup.generate_init_script()?;

    std::fs::write("sources/dev_coin.move", &move_str)?;
    std::fs::write("scripts/init_tokens.sh", &init_script)?;
    std::fs::set_permissions("scripts/init_tokens.sh", PermissionsExt::from_mode(0o755))?;

    let token_list_str = serde_json::to_string_pretty(&coin_list)?;
    std::fs::write("generated/coin-list.json", &token_list_str)?;

    Ok(())
}
