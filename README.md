# Noble Token

## Overview

$NOBLE is an ERC20 token initially deployed on Ethereum mainnet with the end goal of migrating to the Noble AppLayer.

**Contract Address (Ethereum Mainnet):** [`0xe995e5A3A4BF15498246D7620CA39f7409397326`](https://etherscan.io/address/0xe995e5a3a4bf15498246d7620ca39f7409397326)

## Token Specifications

- **Name:** Noble
- **Symbol:** NOBLE
- **Decimals:** 18
- **Initial Supply:** 1,000,000,000 NOBLE
- **Network:** Ethereum Mainnet (temporary)
- **Future Network:** Noble AppLayer

## Migration to Noble AppLayer

This token is designed as a temporary deployment on Ethereum mainnet. The end goal is to migrate all holders to the Noble AppLayer. The contract includes a `burn()` function that allows token holders to burn their allocation, which will be used to verify balances during the creation of the genesis file for the Noble AppLayer launch.

### Burn Mechanism

Token holders can call the `burn()` function to burn their entire balance. This function:
- Burns the caller's balance
- Reduces the total supply accordingly
- Emits a `Transfer` event to the zero address for verification purposes
- Is permissionless - only token holders can burn their own tokens

## Smart Contract

$NOBLE is implemented as a simple ERC20 token using OpenZeppelin's battle-tested contracts.

### Key Features

- **Standard ERC20:** Fully compliant with ERC20 standard
- **Fixed Supply:** 1 billion tokens minted at deployment
- **Burn Functionality:** Holders can burn tokens for AppLayer migration
- **No Admin Functions:** Immutable contract with no upgrade mechanisms

### Contract Structure

```
src/
└── Noble.sol          # Main $NOBLE token contract
```

## Security

The NOBLE token contract has been audited by [Halborn](https://www.halborn.com). The audit report can be found [here](https://github.com/noble-assets/token/releases/tag/v1.0.0) in the `v1.0.0` release artifacts.

## Development

This project uses Foundry for smart contract development.

### Prerequisites

- [Foundry](https://getfoundry.sh/introduction/installation)
- [Bun](https://bun.com/docs/installation) (for dependencies)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/noble-assets/token.git
   cd token
   ```

2. Install dependencies:
   ```bash
   bun install
   ```

3. Build the contract:
   ```bash
   forge build
   ```

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.
