Build
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 move build
```

Deploy
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client publish --gas-budget 30000000
```

```
export PACKAGE_ID=0x80ce3c76f0a431222583aa03d36a594c94e606743bfa2beedfe1b942b7dc8f19
```

Mint NFT
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function mint_nft --module nft --package $PACKAGE_ID --json --gas-budget 10000000 --args "example" "This is an example" "example url" 

```

Getter
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function get_nft_name --module nft --package $PACKAGE_ID --json --gas-budget 10000000 --args 0xe78a1cfb8c9895c83f47dafd54a6f22368db62aa0615308b9f45daa3f0eca136
```

Update description
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function update_description --module nft --package $PACKAGE_ID --json --gas-budget 10000000 --args 0xe78a1cfb8c9895c83f47dafd54a6f22368db62aa0615308b9f45daa3f0eca136 "update description"
```

Transfer NFT
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function transfer --module nft --package $PACKAGE_ID --json --gas-budget 10000000 --args 0xe78a1cfb8c9895c83f47dafd54a6f22368db62aa0615308b9f45daa3f0eca136 0x3ffb3b8b0d89a5fc027c4c93ea135c7bc67824db39107e7029d1e26c9cedbef0
```

Burn
```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function burn --module nft --package $PACKAGE_ID --json --gas-budget 10000000 --args 0xe78a1cfb8c9895c83f47dafd54a6f22368db62aa0615308b9f45daa3f0eca136
```