/// Coins used for devnet.

module faucet::dev_coin {
    use faucet::faucet;
    use mint_wrapper::mint_wrapper;

    /// Creates a coin.
    fun create_coin<CoinType>(
        name: vector<u8>,
        decimals: u64,
        hard_cap: u64
    ) {
        let source = faucet::get_signer();
        let minter = faucet::get_minter();
        mint_wrapper::create_with_coin<CoinType>(&source, name, decimals, hard_cap);
        mint_wrapper::offer_minter<CoinType>(&source, minter, hard_cap);
    }

    
    /// CoinType of Avalanche.
    struct AVAX {}

    /// Initializes the AVAX token.
    public entry fun init_avax() {
        create_coin<AVAX>(b"Avalanche", 9, 1000000000000000000);
    }
    
    /// CoinType of Avery Dennison Corp Class A Shares.
    struct AVERY {}

    /// Initializes the AVERY token.
    public entry fun init_avery() {
        create_coin<AVERY>(b"Avery Dennison Corp Class A Shares", 3, 1000000000000);
    }
    
    /// CoinType of Bamba Rewards.
    struct BAMBA {}

    /// Initializes the BAMBA token.
    public entry fun init_bamba() {
        create_coin<BAMBA>(b"Bamba Rewards", 8, 100000000000000000);
    }
    
    /// CoinType of Ebaumsworld.
    struct BAUM {}

    /// Initializes the BAUM token.
    public entry fun init_baum() {
        create_coin<BAUM>(b"Ebaumsworld", 6, 1000000000000000);
    }
    
    /// CoinType of Bitcoin.
    struct BTC {}

    /// Initializes the BTC token.
    public entry fun init_btc() {
        create_coin<BTC>(b"Bitcoin", 8, 100000000000000000);
    }
    
    /// CoinType of Datum Shares.
    struct DAT {}

    /// Initializes the DAT token.
    public entry fun init_dat() {
        create_coin<DAT>(b"Datum Shares", 7, 10000000000000000);
    }
    
    /// CoinType of Ether.
    struct ETH {}

    /// Initializes the ETH token.
    public entry fun init_eth() {
        create_coin<ETH>(b"Ether", 9, 1000000000000000000);
    }
    
    /// CoinType of Far Protocol.
    struct FAR {}

    /// Initializes the FAR token.
    public entry fun init_far() {
        create_coin<FAR>(b"Far Protocol", 7, 10000000000000000);
    }
    
    /// CoinType of Jain Street DAO.
    struct JAIN {}

    /// Initializes the JAIN token.
    public entry fun init_jain() {
        create_coin<JAIN>(b"Jain Street DAO", 8, 100000000000000000);
    }
    
    /// CoinType of Kanav Korean Holdings.
    struct KNV {}

    /// Initializes the KNV token.
    public entry fun init_knv() {
        create_coin<KNV>(b"Kanav Korean Holdings", 6, 1000000000000000);
    }
    
    /// CoinType of Kysama Protocol Token.
    struct KSAM {}

    /// Initializes the KSAM token.
    public entry fun init_ksam() {
        create_coin<KSAM>(b"Kysama Protocol Token", 7, 10000000000000000);
    }
    
    /// CoinType of Morimoto Restaurant Group.
    struct MO {}

    /// Initializes the MO token.
    public entry fun init_mo() {
        create_coin<MO>(b"Morimoto Restaurant Group", 6, 1000000000000000);
    }
    
    /// CoinType of Near Protocol.
    struct NEAR {}

    /// Initializes the NEAR token.
    public entry fun init_near() {
        create_coin<NEAR>(b"Near Protocol", 7, 10000000000000000);
    }
    
    /// CoinType of Salaam Bankorus Freud.
    struct SBF {}

    /// Initializes the SBF token.
    public entry fun init_sbf() {
        create_coin<SBF>(b"Salaam Bankorus Freud", 8, 100000000000000000);
    }
    
    /// CoinType of Saber Protocol Token.
    struct SBR {}

    /// Initializes the SBR token.
    public entry fun init_sbr() {
        create_coin<SBR>(b"Saber Protocol Token", 6, 1000000000000000);
    }
    
    /// CoinType of ShakeN Token.
    struct SHAKE {}

    /// Initializes the SHAKE token.
    public entry fun init_shake() {
        create_coin<SHAKE>(b"ShakeN Token", 6, 1000000000000000);
    }
    
    /// CoinType of Shamu Protocol Token.
    struct SHAM {}

    /// Initializes the SHAM token.
    public entry fun init_sham() {
        create_coin<SHAM>(b"Shamu Protocol Token", 6, 1000000000000000);
    }
    
    /// CoinType of Solana.
    struct SOL {}

    /// Initializes the SOL token.
    public entry fun init_sol() {
        create_coin<SOL>(b"Solana", 9, 1000000000000000000);
    }
    
    /// CoinType of Tinghua Investment Group.
    struct TING {}

    /// Initializes the TING token.
    public entry fun init_ting() {
        create_coin<TING>(b"Tinghua Investment Group", 7, 10000000000000000);
    }
    
    /// CoinType of USD Coin.
    struct USDC {}

    /// Initializes the USDC token.
    public entry fun init_usdc() {
        create_coin<USDC>(b"USD Coin", 6, 1000000000000000);
    }
    
    /// CoinType of Tether USD.
    struct USDT {}

    /// Initializes the USDT token.
    public entry fun init_usdt() {
        create_coin<USDT>(b"Tether USD", 6, 1000000000000000);
    }
    
    /// CoinType of Wrapped SUI.
    struct WSUI {}

    /// Initializes the WSUI token.
    public entry fun init_wsui() {
        create_coin<WSUI>(b"Wrapped SUI", 6, 1000000000000000);
    }
    
    /// CoinType of Aptos.
    struct APTOS {}

    /// Initializes the APTOS token.
    public entry fun init_aptos() {
        create_coin<APTOS>(b"Aptos", 4, 10000000000000);
    }
    
}