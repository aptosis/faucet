#!/usr/bin/env -S bash -xe

# Fund the newly created account
aptos account fund --account 0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0

# Publish the Faucet module
aptos-publish --profile faucet

# Initialize the Faucet
aptos-move-run \
    --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::Faucet::initialize" \
    --args address:d21e5c6e363a5ae4815ac7ef8e08301f36a8af54c08481c2ce3cb137ef28ff80 \
    --profile faucet

# Initialize our coins

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_avax"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_avery"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_bamba"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_baum"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_btc"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_dat"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_eth"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_far"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_jain"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_knv"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_ksam"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_mo"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_near"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_sbf"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_sbr"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_shake"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_sham"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_sol"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_ting"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_usdc"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_usdt"

aptos-move-run --function-id "0x10cf22de3cef0a6ef68b2da43e1d20c189c033c93a8503a40ee06c0347a11ea0::DevCoin::init_wsui"

