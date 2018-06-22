//
//  GameViewControllerTests.swift
//  Tic-Tac-ToeTests
//
//  Created by Avinash Reddy on 6/21/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import XCTest
@testable import Tic_Tac_Toe

class GameViewControllerTests: XCTestCase {
    
    // GameViewController object declaration
    var gameVC: GameViewController!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Object initialization
        gameVC = GameViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        gameVC = nil
    }
    
    func testPlayerTurnValue() {
        // Testing player turn value to 1
        XCTAssertEqual(gameVC.playerTurn, 1)
    }
    
    func testWinningCombinations() {
        // Testing an array of winning combinations data of Tic Tac Toe
        XCTAssertEqual(gameVC.winningCombinations[0], [0, 1, 2])
        XCTAssertEqual(gameVC.winningCombinations[1], [3, 4, 5])
        XCTAssertEqual(gameVC.winningCombinations[2], [6, 7, 8])
        XCTAssertEqual(gameVC.winningCombinations[3], [0, 3, 6])
        XCTAssertEqual(gameVC.winningCombinations[4], [1, 4, 7])
        XCTAssertEqual(gameVC.winningCombinations[5], [2, 5, 8])
        XCTAssertEqual(gameVC.winningCombinations[6], [0, 4, 8])
        XCTAssertEqual(gameVC.winningCombinations[7], [2, 4, 6])
    }
    
    func testInitialPlayerXScore() {
        // Testing playerXScore value to 0
        XCTAssertEqual(gameVC.playerXScore, 0)
    }
    
    func testInitialPlayerOScore() {
        // Testing playerOScore value to 0
        XCTAssertEqual(gameVC.playerOScore, 0)
    }
    
    func testInitialGameStartState() {
        // Testing game start value to true
        XCTAssertTrue(gameVC.gameStart)
    }
    
    func testInitialNumberOfTurns() {
        // Testing number of turns for the two players
        XCTAssertFalse(gameVC.numberOfTurns > 9)
        XCTAssertTrue(gameVC.numberOfTurns == 1)
    }
    
    func testInitialFilledCanvas() {
        // Testing if the canvas is filled with 0's or not
        XCTAssertEqual(gameVC.filledCanvas[0], 0)
        XCTAssertEqual(gameVC.filledCanvas[1], 0)
        XCTAssertEqual(gameVC.filledCanvas[2], 0)
        XCTAssertEqual(gameVC.filledCanvas[3], 0)
        XCTAssertEqual(gameVC.filledCanvas[4], 0)
        XCTAssertEqual(gameVC.filledCanvas[5], 0)
        XCTAssertEqual(gameVC.filledCanvas[6], 0)
        XCTAssertEqual(gameVC.filledCanvas[7], 0)
        XCTAssertEqual(gameVC.filledCanvas[8], 0)
    }
    
    func testShowResultGameStartValue() {
        // Testing for game start value after executing showResult() function
        gameVC.showResult()
        XCTAssertFalse(gameVC.gameStart)
    }
    
    func testShowResultPlayerTurn() {
        // Testing for Player Turn value after executing showResult() function
        gameVC.showResult()
        XCTAssertFalse(gameVC.playerTurn == -1)
        XCTAssertFalse(gameVC.playerTurn != 1)
    }
    
    func testShowResultPlayerXScore() {
        // Testing for Player X Score value after executing showResult() function
        gameVC.showResult()
        gameVC.playerXScore += 1
        XCTAssertEqual(gameVC.playerXScore, 1)
    }
    
    func testShowResultPlayerOScore() {
        // Testing for Player O Score value after executing showResult() function
        gameVC.showResult()
        gameVC.playerOScore += 1
        XCTAssertNotEqual(gameVC.playerOScore, 1)
    }
    
    func testShowResultPlayerTurnLabel() {
        gameVC.showResult()
        XCTAssertEqual((gameVC.playerTurnLabel != nil), false)
    }
    
    func testShowResultPlayerXScoreLabel() {
        // Testing for Player X Score label after executing showResult() function
        gameVC.showResult()
        XCTAssertEqual("Player 2 (X) : \(gameVC.playerXScore)", "Player 2 (X) : 0" )
    }
    
    func testShowResultPlayerOScoreLabel() {
        // Testing for Player O Score label after executing showResult() function
        gameVC.showResult()
        XCTAssertEqual("Player 2 (O) : \(gameVC.playerOScore)", "Player 2 (O) : 1" )
    }
    
    
    func testRestartGamePressedGameStart() {
        // Testing to check if game start value is true
        gameVC.restartGamePressed(0)
        XCTAssertTrue(gameVC.gameStart)
    }
    
    func testRestartGamePressedPlayerTurn() {
        // Testing to check if player turn value is 1
        gameVC.restartGamePressed(0)
        XCTAssertTrue(gameVC.playerTurn == 1)
    }
    
    func testRestartGamePressedFilledCanvas() {
        // Testing to check if filled canvas consists of 0's
        gameVC.restartGamePressed(0)
        XCTAssertEqual(gameVC.filledCanvas[0], 0)
        XCTAssertEqual(gameVC.filledCanvas[1], 0)
        XCTAssertEqual(gameVC.filledCanvas[2], 0)
        XCTAssertEqual(gameVC.filledCanvas[3], 0)
        XCTAssertEqual(gameVC.filledCanvas[4], 0)
        XCTAssertEqual(gameVC.filledCanvas[5], 0)
        XCTAssertEqual(gameVC.filledCanvas[6], 0)
        XCTAssertEqual(gameVC.filledCanvas[7], 0)
        XCTAssertEqual(gameVC.filledCanvas[8], 0)
    }
    
    func testRestartGamePressedPlayerTurnLabel() {
        // Testing to check if the player turn label is hidden or not
        gameVC.restartGamePressed(0)
        XCTAssertFalse((gameVC.playerTurnLabel != nil))
    }
}
