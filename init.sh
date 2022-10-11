flow project deploy -n emulator --update
flow-run transactions send ./cadence/transactions/CreateCollection.cdc --signer emulator-account
flow-run transactions send ./cadence/transactions/DepositNFT.cdc "My carbon credit" 10 "123" --signer emulator-account

flow-run scripts execute ./cadence/scripts/LoadNFT.cdc "0xf8d6e0586b0a20c7" 
