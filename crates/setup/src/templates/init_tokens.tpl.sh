#!/usr/bin/env -S bash -xe

# Fund the newly created account
aptos account fund --account {{ faucet_address }}

# Publish the Faucet module
aptos-publish --profile faucet

# Initialize the Faucet
aptos-move-run \
    --function-id "{{ faucet_address }}::Faucet::initialize" \
    --args address:{{ aptosis_minter_address }} \
    --profile faucet

# Initialize our coins
{% for coin in coins %}
aptos-move-run --function-id "{{ faucet_address }}::DevCoin::init_{{ coin.symbol | lower }}"
{% endfor %}
