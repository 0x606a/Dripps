# FEVM Hardhat Kit

## Cloning the Repo

Open up your terminal (or command prompt) and navigate to a directory you would like to store this code on. Once there type in the following command:


```
git clone https://github.com/filecoin-project/FEVM-Hardhat-Kit.git
cd FEVM-hardhat-kit
yarn install
```


This will clone the hardhat kit onto your computer, switch directories into the newly installed kit, and install the dependencies the kit needs to work.


## Get a Private Key

You can get a private key from a wallet provider [such as Metamask](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key).


## Add your Private Key as an Environment Variable

Add your private key as an environment variable by running this command: 
 
 ```
export PRIVATE_KEY='abcdef'
```

 \
If you use a .env file, don't commit and push any changes to .env files that may contain sensitive information, such as a private key! If this information reaches a public GitHub repository, someone can use it to check if you have any Mainnet funds in that wallet address, and steal them!


## Get the Deployer Address

Run this command:
```
yarn hardhat get-address
```

f4address (for use with faucet) =  f410fenekuymnm7v3rbekwx2xqiiry26rzlglhpasuva
Ethereum address: 0x2348aa618d67EbB8848Ab5f5782111C6bd1cAccB

The f4address is the filecoin representation of your Ethereum address. This will be needed for the faucet in the next step.

The Ethereum address will be used otherwise.


## Fund the Deployer Address

Go to the [Wallaby faucet](https://wallaby.network/#faucet), and paste in the f4 address we copied in the previous step. This will send some wallaby testnet FIL to the account.


## Deploy the SimpleCoin Contract

Type in the following command in the terminal: 
 
 ```
yarn hardhat deploy
```

This will compile the contract and deploy it to the Wallaby network automatically!

Keep note of the deployed contract address for the next step.

If you read the Solidity code for SimpleCoin, you will see in the constructor our deployer account automatically gets assigned 10000 SimpleCoin when the contract is deployed.

Compiled 6 Solidity files successfully
Wallet Ethereum Address: 0x2348aa618d67EbB8848Ab5f5782111C6bd1cAccB
Wallet f4Address:  f410fenekuymnm7v3rbekwx2xqiiry26rzlglhpasuva
deploying "SimpleCoin" (tx: 0xc0d5616bcd1e378ef25028a07d6869424dc7eb52083759230240b190a6ed05e4)...: deployed at 0x055Bf6C59E4d8f4133AAF56ee83F0d5c15fDA5F9 with 30459862 gas
deploying "MinerAPI" (tx: 0xdb12b411ab81f6289fbada2e43b2cd8dfba4cc68fb16af3ce427260793f403c7)...: deployed at 0x7F4E05a75664746bf7e902414E9B1A6b431e4de2 with 85863231 gas
deploying "MarketAPI" (tx: 0xc709659aebed91bfe8d999bb45571e460814a167ab952b33f363aa65736845ce)...: deployed at 0x2c6048E947919B1F05f88Fd82DB960c5cD3Be57b with 128219385 gas
✨  Done in 186.01s.

## Read your SimpleCoin balance

Type in the following command in the terminal: 
 
 ```
yarn hardhat get-balance --contract 'THE DEPLOYED CONTRACT ADDRESS HERE' --account 'YOUR F4 ADDRESS HERE'
```
```
yarn hardhat get-balance --contract '0x055Bf6C59E4d8f4133AAF56ee83F0d5c15fDA5F9' --account 'f410fenekuymnm7v3rbekwx2xqiiry26rzlglhpasuva'
```
```
Reading SimpleCoin owned by f410fenekuymnm7v3rbekwx2xqiiry26rzlglhpasuva  on network  wallaby
An unexpected error occurred:

Error: network does not support ENS (operation="getResolver", network="unknown", code=UNSUPPORTED_OPERATION, version=providers/5.7.2)
    at Logger.makeError (/Users/loizage/code/HackFEVM/Dripps/node_modules/@ethersproject/logger/src.ts/index.ts:269:28)
    at Logger.throwError (/Users/loizage/code/HackFEVM/Dripps/node_modules/@ethersproject/logger/src.ts/index.ts:281:20)
    at EthersProviderWrapper.<anonymous> (/Users/loizage/code/HackFEVM/Dripps/node_modules/@ethersproject/providers/src.ts/base-provider.ts:1989:20)
    at step (/Users/loizage/code/HackFEVM/Dripps/node_modules/@ethersproject/providers/lib/base-provider.js:48:23)
    at Object.next (/Users/loizage/code/HackFEVM/Dripps/node_modules/@ethersproject/providers/lib/base-provider.js:29:53)
    at fulfilled (/Users/loizage/code/HackFEVM/Dripps/node_modules/@ethersproject/providers/lib/base-provider.js:20:58)
    at processTicksAndRejections (node:internal/process/task_queues:96:5) {
  reason: 'network does not support ENS',
  code: 'UNSUPPORTED_OPERATION',
  operation: 'getResolver',
  network: 'unknown'
}
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```
The console should read that your account has 10000 SimpleCoin!
