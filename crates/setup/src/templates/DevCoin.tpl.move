/// Coins used for devnet.

module Faucet::DevCoin {
    use Faucet::Faucet;
    use MintWrapper::MintWrapper;

    /// Creates a coin.
    fun create_coin<CoinType>(
        name: vector<u8>,
        decimals: u64,
        hard_cap: u64
    ) {
        let source = Faucet::get_signer();
        let minter = Faucet::get_minter();
        MintWrapper::create_with_coin<CoinType>(&source, name, decimals, hard_cap);
        MintWrapper::offer_minter<CoinType>(&source, minter, hard_cap);
    }

    {% for coin in coins %}
    /// CoinType of {{ coin.name }}.
    struct {{ coin.symbol }} {}

    /// Initializes the {{ coin.symbol }} token.
    public(script) fun init_{{ coin.symbol | lower }}() {
        create_coin<{{ coin.symbol }}>(b"{{ coin.name }}", {{ coin.decimals }}, {{ coin.hard_cap }});
    }
    {% endfor %}
}