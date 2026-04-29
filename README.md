# Arc Chess ♟️

A decentralized chess game deployed on **Arc Testnet**, supporting OKX Wallet connection and on-chain gameplay.

**Tech Stack**: Solidity + Ethers.js + OKX Wallet + Arc Testnet

---

## Project Introduction

Arc Chess is a simple on-chain chess battle project. It is currently in **MVP testing stage**, primarily used to test wallet interaction, smart contract calls, and on-chain move recording on the Arc network.

Players can create or join games through the smart contract, with each move recorded on the blockchain (this version is simplified and does not validate the legality of chess moves).

---

## Contract Information

- **Network**: Arc Testnet  
- **Chain ID**: 5042002  
- **Contract Address**: `0xb73fd77252d5a54B718340d04e018D4219DfA05F`  
- **Gas Token**: USDC (Gas fees are paid in USDC)  
- **Solidity Version**: ^0.8.20  
- **License**: MIT  
- **Block Explorer**: [https://testnet.arcscan.app](https://testnet.arcscan.app)

---

## Project Structure
ArcChess/
├── contracts/
│   └── ArcChess.sol          # Main smart contract
├── frontend/
│   └── index.html            # OKX Wallet connection test page
├── README.md
└── hardhat.config.js         # (Optional) Hardhat configuration file

---

## Features

- ✅ Create new games on Arc Testnet
- ✅ Join existing games (1v1)
- ✅ Record moves on-chain using standard Algebraic Notation (e.g., "e2e4")
- ✅ Auto end game (demo logic: ends automatically after 20 moves)
- ✅ OKX Wallet connection and interaction support
- ✅ Event emission (GameCreated, MoveMade, GameEnded)

---

## How to Use

### 1. Add Arc Testnet Network

Add the following network to your OKX Wallet (manually or via one-click):

- **Network Name**: Arc Testnet  
- **RPC URL**: `https://rpc.testnet.arc.network`  
- **Chain ID**: `5042002`  
- **Currency Symbol**: `USDC`  
- **Block Explorer**: `https://testnet.arcscan.app`

### 2. Get Test Tokens

Since Arc Testnet uses **USDC** as the gas token, please claim test USDC from the official faucet to ensure your wallet has enough balance to pay for gas fees.

### 3. Run the Frontend

1. Download or clone this project
2. Open the `frontend/index.html` file (you can open it directly in the browser or use Live Server)
3. Click the **"Connect OKX Wallet"** button
4. Confirm the connection in the OKX Wallet popup

### 4. Game Flow (Simplified Version)

- Player A calls `createGame()` to create a new game
- Player B calls `joinGame(gameId)` to join the game
- Both players take turns calling `makeMove(gameId, moveNotation)` to make moves
- The game automatically ends after 20 moves (will be replaced with real checkmate logic later)

---

## Roadmap

- [ ] Integrate real chess move validation logic
- [ ] Develop a visual chessboard frontend (recommended: chessboard.js)
- [ ] Implement full win/loss conditions (checkmate, timeout, draw, etc.)
- [ ] Add game timeout mechanism
- [ ] Build a complete React / Next.js frontend
- [ ] Deploy to Arc Mainnet

---

## Notes

- The current contract **does not validate move legality** and is intended for functional demonstration and wallet interaction testing only.
- All transactions can be viewed on the [Arc Testnet Block Explorer](https://testnet.arcscan.app).
- Please make sure you are operating on the Arc Testnet network and hold sufficient test USDC.

