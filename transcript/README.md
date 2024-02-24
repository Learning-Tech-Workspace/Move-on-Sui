# Version 01

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

# Version 02 (Object Wrapping)

```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function create_wrappable_transcript_object --module transcript --package $PACKAGE_ID --json --gas-budget 10000000 --args 7 8 3
```

```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function request_transcript --module transcript --package $PACKAGE_ID --json --gas-budget 10000000 --args 0xbe9363c0aae3a763a1fb7d5a9b5d5e37ac1917bc98eaacab076d1f27ad387ef8 0x7c6f6af0c47256d8fa8ed8bfb7057a1503f64ed992656355fce62c5068ff8267
```

```
$SUI_TESTNET_HOME/sui-ubuntu-x86_64 client call --function unpack_wrapped_transcript --module transcript --package $PACKAGE_ID --json --gas-budget 10000000 --args 0x2155f70a4a775ab67fccc3718f2b1829c245f10fcec8286904a6171fecee7ecf
```