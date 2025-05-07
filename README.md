🎲 Raffle – Chainlink VRF v2.5 Lottery

A fully‑tested lottery dApp written in Solidity 0.8.19 and powered by Chainlink VRF v2.5 for on‑chain verifiable randomness. Built with Foundry, with one‑click scripts for local Anvil forks and Sepolia deployments.



## ✨ Features

Fair randomness – Chainlink VRF v2.5 provides tamper‑proof, audited random numbers.

Automated upkeep – Time‑based interval logic determines when a new winner can be picked.

Foundry dev‑experience – ultra‑fast compilation, fuzzing, cheat‑codes & gas snapshots.

Environment‑aware – automatically spins up local mocks or uses live Sepolia coordinator.

Script‑driven DevOps – create/fund VRF subscriptions, add consumers & deploy contracts via one‑liners.

100 % test coverage – unit & integration tests covering all critical paths.



## 📁 Directory Structure

├── src/                # Production Solidity contracts
│   └── Raffle.sol
├── script/             # Forge scripts (deployment, helpers, interactions)
│   ├── DeployRaffle.s.sol
│   ├── HelperConfig.s.sol
│   └── Interactions.s.sol (CreateSubscription / FundSubscription / AddConsumer)
├── test/               # Foundry tests & mocks
│   ├── mocks/LinkToken.sol
│   └── unit/RaffleTest.t.sol
├── broadcast/          # Forge broadcast artifacts (git‑ignored)
├── out/ & cache/       # Build artefacts (git‑ignored)
├── foundry.toml        # Foundry configuration
└── Makefile            # Convenience targets (build / test / deploy)


## 🏗️ Architecture & Contracts

Raffle.sol

- Core lottery logic. Users send ETH to enter; performUpkeep requests a random winner; fulfillRandomWords distributes prize

DeployRaffle.s.sol

- Idempotent deployment script – orchestrates mocks, VRF subscription & consumer setup

HelperConfig.s.sol

- Holds per‑network parameters (gas lane, coordinator address, subscription ID, etc.)

Interactions.s.sol

- Utility scripts to create / fund VRF subscriptions and add consumers

LinkToken.sol

- Minimal LINK ERC‑677 token mock for local testing

// GasLane / KeyHash & callbackGasLimit are sourced from Chainlink docs. Edit HelperConfig if you target a different network.


## 🚀 Installation

git clone https://github.com/avrakadabra/foundry-smart-contract-lottery.git
cd foundry-smart-contract-lottery
make install          # installs dev‑ops sub‑modules (no commit)



## 🧑‍💻 Build & Test

# compile & run static analysis
make build

# run all unit + fuzz tests (default 256 runs)
make test             # alias for `forge test -vvv`


## 🔐 Security Notes

No secrets in Git – .env and build artefacts are git‑ignored.

Re‑entrancy – prize payout happens last (CEI pattern) after state reset.

LINK withdrawal – subscription funding is capped & mocks mirror LINK semantics.

Randomness compliance – follows VRF v2.5 recommendations: numWords = 1, requestConfirmations = 3.

Cheat‑code only in tests – no cheat‑codes in prod contracts.


## 📜 License
MIT © 2025 Avrakadabra – do what you want, but sign your commits. 😉


### Acknowledgements

Chainlink Docs – https://docs.chain.link/vrf/v2-5

Foundry Book – https://book.getfoundry.sh

Inspired by Patrick Collins’ Cyfrin 'Foundry Fundamentals' course.

