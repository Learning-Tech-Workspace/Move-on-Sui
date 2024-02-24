```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function create_transcript_object --module transcript --package $PACKAGE_ID --json --gas-budget 10000000 --args 8 10 5
```

```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function view_score --module transcript --package $PACKAGE_ID --gas-budget 10000000 --args 0xf9c50122ebd8419e031b389a6c7cbae79d4af4719b134289c9b9139164144f60
```

```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function update_score --module transcript --package $PACKAGE_ID --gas-budget 10000000 --args 0xf9c50122ebd8419e031b389a6c7cbae79d4af4719b134289c9b9139164144f60 7
```

```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function delete_transcript --module transcript --package $PACKAGE_ID --gas-budget 10000000 --args 0xf9c50122ebd8419e031b389a6c7cbae79d4af4719b134289c9b9139164144f60
```