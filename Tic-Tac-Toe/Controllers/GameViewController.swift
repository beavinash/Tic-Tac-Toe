//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Avinash Reddy on 6/18/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // UILabel to display data related to score and current turn of the player
    @IBOutlet weak var playerXScoreLabel: UILabel!
    @IBOutlet weak var playerOScoreLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    // This IBOutlet variable used for animation of UIButton
    @IBOutlet weak var animateButton: UIButton!
    
    // This variable will keep track of a player turn in a game
    var playerTurn: Int = 1
    
    // This variable shows the winning combinations Tic Tac Toe game can have
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal winning combinations
                               [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical winning combinations
                               [0, 4, 8], [2, 4, 6]] // Diagnol winning combinations
    
    // Variables that keep track of player scores
    var playerXScore = 0
    var playerOScore = 0
    
    // For game state to determine if the game ended or not
    var gameStart: Bool = true
    
    // Player Turns count
    var numberOfTurns = 1
    
    // Tic Tac Toe board filled
    var filledCanvas = Array(repeating: 0, count: 9)
    
    
    // MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Tic Tac Toe custom functions
    @IBAction func playButtonPressed(_ sender: AnyObject) {
        
        let canvasIndex = sender.tag - 1
        
        // Condition to check if the box is filled and game start is true
        if filledCanvas[canvasIndex] == 0 && gameStart {
            
            filledCanvas[canvasIndex] = playerTurn
            
            // To dispaly Player 1 or Player 2 button image
            if playerTurn == 1 {
                sender.setImage(UIImage(named: "X"), for: [])
            } else {
                sender.setImage(UIImage(named: "O"), for: [])
            }
            
            playerTurn *= -1
            numberOfTurns += 1
            playerTurnLabel.text = "Player \((playerTurn + 3) % 3 )'s turn"
            playerTurnLabel?.flashPlayerTurnLabel()
            
            
            let row = canvasIndex / 3
            let column = canvasIndex % 3
            
            var sum1 = 0, sum2 = 0
            // Looping through constant times to fill canvas with values
            for i in 0...2 {
                sum1 += filledCanvas[i * 3 + column]
                sum2 += filledCanvas[row * 3 + i]
            }
            
            if abs(sum1) == 3 || abs(sum2) == 3 {
                showResult()
            }
            
            if (row + column) % 2 == 0 {
                sum1 = filledCanvas[0] + filledCanvas[4] + filledCanvas[8]
                sum2 = filledCanvas[2] + filledCanvas[4] + filledCanvas[6]
                
                if abs(sum1) == 3 || abs(sum2) == 3 {
                    showResult()
                }
            }
            
            // Condition to check if number of turns greater than 9 and game start value
            if (numberOfTurns > 9 && gameStart) {
                displayAlert(title: "Winner is: ", message: "The game is drawn!")
                playerTurnLabel.isHidden = true
                animateButton?.pulsateRestartGameButton()
                return
            }
        } else if filledCanvas[canvasIndex] != 0 { // To display alert if the box is already used
            displayAlert(title: "Alert!", message: "This box is already used.")
        }
    }
    
    // Function to display the winner
    func showResult() {
        gameStart = false
        // Condition to check the winner and display alert
        if playerTurn == -1  {
            displayAlert(title: "Winner is: ", message: "Player 1 (X)")
            playerXScore += 1
            playerXScoreLabel?.text = "Player 1 (X) : \(playerXScore)"
            playerTurnLabel.isHidden = true
            animateButton?.pulsateRestartGameButton()
        } else {
            displayAlert(title: "Winner is: ", message: "Player 2 (O)")
            playerOScore += 1
            playerOScoreLabel?.text = "Player 2 (O) : \(playerOScore)"
            playerTurnLabel?.isHidden = true
            animateButton?.pulsateRestartGameButton()
        }
    }
    
    // To restart the game to initial instance
    @IBAction func restartGamePressed(_ sender: Any) {
        playerTurn = 1
        playerTurnLabel?.text = "Player \(playerTurn)'s turn"
        playerTurnLabel?.flashPlayerTurnLabel()
        gameStart = true
        filledCanvas = Array(repeating: 0, count: 9)
        numberOfTurns = 1
        playerTurnLabel?.isHidden = false
        
        for index in 1...9 {
            if let button = view.viewWithTag(index) as? UIButton {
                button.setImage(nil, for: UIControlState.normal)
            }
        }
    }
    
    // To display alert
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Memory managment
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
