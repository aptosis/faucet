/// A coin faucet for the Aptos devnet.

module Faucet::Faucet {
    use AptosFramework::Account::{Self, SignerCapability};
    use Deployer::Deployer;

    friend Faucet::DevCoin;

    /// Faucet configuration.
    struct FaucetConfiguration has key {
        /// Signer capability of the Faucet address.
        signer_cap: SignerCapability,
        /// Address which will become the Mint Wrapper Minter.
        minter: address
    }

    /// Initializes the [Faucet].
    public(script) fun initialize(faucet: &signer, minter: address) {
        let signer_cap = Deployer::retrieve_resource_account_cap(faucet);
        move_to(faucet, FaucetConfiguration {
            signer_cap,
            minter
        });
    }

    /// Gets the signer of the module.
    public(friend) fun get_signer(): signer acquires FaucetConfiguration {
        let signer_cap = &borrow_global<FaucetConfiguration>(@Faucet).signer_cap;
        Account::create_signer_with_capability(signer_cap)
    }

    /// Gets the minter which will mint coins in this faucet.
    public fun get_minter(): address acquires FaucetConfiguration {
        borrow_global<FaucetConfiguration>(@Faucet).minter
    }
}
