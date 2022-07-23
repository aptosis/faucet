#!/usr/bin/env -S bash -xe

# Fund the newly created account
aptos account fund --account 0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a

# Publish the Faucet module
aptos-publish --profile faucet

# Initialize the Faucet
aptos-move-run \
    --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::faucet::initialize" \
    --args address:b3dfbce7ba1564267489eba0206ed21ce723c4ba89913fbe18b1bdad8155519e \
    --profile faucet

# Initialize our coins

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_avax"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_avery"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_bamba"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_baum"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_btc"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_dat"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_eth"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_far"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_jain"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_knv"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_ksam"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_mo"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_near"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_sbf"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_sbr"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_shake"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_sham"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_sol"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_ting"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_usdc"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_usdt"

aptos-move-run --function-id "0x2522bca997f581b007c8977992f4e38cd756bf11fc263d29a4275b703259a21a::dev_coin::init_wsui"

