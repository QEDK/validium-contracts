# Validium Contracts

Smart contract implementation which will be used by the Avail Validium-based networks

[![Main CI](https://github.com/0xPolygonHermez/zkevm-contracts/actions/workflows/main.yml/badge.svg)](https://github.com/0xPolygonHermez/zkevm-contracts/actions/workflows/main.yml)

## Note

Private keys and mnemonics contained in this repository are used for internal test exclusively. Do not use them in production environments

## Requirements

- node version: 16.x
- npm version: 7.x

## Repository structure

- `contracts`: zkevm contracts
  - `PolygonZkEVMBridge.sol`: transfer assets between chains
    - `PolygonZkEVMGlobalExitRoot.sol`: manage global exit root in L1
    - `PolygonZkEVMGlobalExitRootL2.sol`: manage global exit root in L2
  - `PolygonZkEVM.sol`: consensus algorithm used by polygon hermez zkevm
- `docs`: specs and useful links
- `test`: contracts tests

## Activate github hook

```
git config --local core.hooksPath .githooks/
```

## Install

```
npm i
```

## Run tests

```
npm run test
```

## Run Linter

See errors:

```
npm run lint
```

Autofix errors:

```
npm run lint:fix
```

## Deploy on hardhat

```
npm run deploy:ZkEVM:hardhat
```

## Build dockers

```
npm run docker:contracts
```

A new docker `hermez-geth1.3:latest` will be created
This docker will contain a geth node with the deployed contracts
The deployment output can be found in: `docker/deploymentOutput/deploy_output.json`
To run the docker you can use: `docker run -p 8545:8545 hermez-geth1.3:latest`

## Note

In order to test, the following private keys are being used. These keys are not meant to be used in any production environment:

- private key: `0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80`
  - address:`0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266`
- private key: `0xdfd01798f92667dbf91df722434e8fbe96af0211d4d1b82bbbbc8f1def7a814f`
  - address:`0xc949254d682d8c9ad5682521675b8f43b102aec4`

## Verify Deployed Smart Contracts

To verify that the smartcontracts of this repository are the same deployed on mainnet, you could follow the instructions described [document](verifyMainnetDeployment/verifyDeployment.md)

The smartcontract used to verify a proof, it's a generated contract from zkEVM Rom and Pil (constraints). To verify the deployment of this smartcontract you could follow the instructions described in this [document](verifyMainnetDeployment/verifyMainnetProofVerifier.md)

## Contribution Guidelines

### Rules

Avail welcomes contributors from every background and skill level. Our mission is to build a community that's not only welcoming and friendly but also aligned with the best development practices. Interested in contributing to this project? Whether you've spotted an issue, have improvement ideas, or want to add new features, we'd love to have your input. Simply open a GitHub issue or submit a pull request to get started.

1. Before asking any questions regarding how the project works, please read through all the documentation and install the project on your own local machine to try it and understand how it works. Please ask your questions in open channels (Github and [Telegram](https://t.me/avail_uncharted/5)).

2. To work on an issue, first, get approval from a maintainer or team member. You can request to be assigned by commenting on the issue in GitHub. This respects the efforts of others who may already be working on the same issue. Unapproved PRs may be declined.

3. When assigned to an issue, it's expected that you're ready to actively work on it. After assignment, please provide a draft PR or update within one week. If you encounter delays, communicate with us to maintain your assignment.

4. Got an idea or found a bug? Open an issue with the tags [New Feature] or [Bug]. Provide detailed information like reproduction steps (for bugs) or a basic feature proposal. The team will review and potentially assign you to it.

5. Start a draft PR early in your development process, even with incomplete changes. This allows us to track progress, provide timely reviews, and assist you. Expect feedback on your drafts periodically.

## License
All contracts except for `DARouterVerification.sol`, `MockDABridgeRouter.sol`, `MockDABridgeRouter.sol` and `Merkle.sol` are released under AGPL v3 (see [LICENSE](LICENSE)). The excepted contracts are released under Apache v2.
