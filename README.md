# Aptosis Devnet Faucet

A coin faucet for the Aptos devnet.

# Setup

To update this repo, run `cargo run --bin setup && ./scripts/init_tokens.sh`.

## Installation

To use faucet in your code, add the following to the `[addresses]` section of your `Move.toml`:

```toml
[addresses]
faucet = "0x6fdf5c5cf431d5db75b2b53f0df8aa6687056d47ea7a588e9c512dd2b7a810a8"
```

## License

Apache-2.0
