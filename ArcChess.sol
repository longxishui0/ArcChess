// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArcChess {
    address public owner;
    
    struct Game {
        address player1;
        address player2;
        uint8 turn;           // 0 = 白棋 (player1), 1 = 黑棋 (player2)
        bool isActive;
        uint256 moveCount;
    }

    mapping(uint256 => Game) public games;
    uint256 public gameCounter;

    event GameCreated(uint256 gameId, address player1);
    event MoveMade(uint256 gameId, address player, string move, uint256 moveCount);
    event GameEnded(uint256 gameId, address winner);

    constructor() {
        owner = msg.sender;
    }

    // 创建新对局
    function createGame() external {
        gameCounter++;
        games[gameCounter] = Game({
            player1: msg.sender,
            player2: address(0),
            turn: 0,
            isActive: true,
            moveCount: 0
        });
        emit GameCreated(gameCounter, msg.sender);
    }

    // 加入对局
    function joinGame(uint256 gameId) external {
        Game storage game = games[gameId];
        require(game.player2 == address(0), "Game already full");
        require(game.player1 != msg.sender, "Cannot play against yourself");
        
        game.player2 = msg.sender;
    }

    // 每走一步调用一次（目前简化版，不验证棋合法性）
    function makeMove(uint256 gameId, string calldata moveNotation) external {
        Game storage game = games[gameId];
        require(game.isActive, "Game is not active");

        if (game.turn == 0) {
            require(msg.sender == game.player1, "Not your turn");
        } else {
            require(msg.sender == game.player2, "Not your turn");
        }

        game.moveCount++;
        game.turn = 1 - game.turn;   // 切换玩家

        emit MoveMade(gameId, msg.sender, moveNotation, game.moveCount);

        // 演示：走满 20 步自动结束（后面可以改成真实将死判断）
        if (game.moveCount >= 20) {
            game.isActive = false;
            emit GameEnded(gameId, msg.sender);
        }
    }

    // 查看对局信息
    function getGame(uint256 gameId) external view returns (Game memory) {
        return games[gameId];
    }
}