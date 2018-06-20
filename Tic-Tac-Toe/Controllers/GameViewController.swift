//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Avinash Reddy on 6/18/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var playerXScoreLabel: UILabel!
    @IBOutlet weak var playerOScoreLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    // This variable will keep track of a player turn in a game
    var playerTurn: Int = 1
    
    // This variable shows the winning combinations Tic Tac Toe game can have
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                               [0, 3, 6], [1, 4, 7], [2, 5, 8],
                               [0, 4, 8], [2, 4, 6]]
    
    
    var playerXScore = 0
    var playerOScore = 0
    
    // Game state
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
        
        if filledCanvas[canvasIndex] == 0 && gameStart {
            
            filledCanvas[canvasIndex] = playerTurn
            
            if playerTurn == 1 {
                sender.setImage(UIImage(named: "X"), for: [])
            } else {
                sender.setImage(UIImage(named: "O"), for: [])
            }
            
            playerTurn *= -1
            numberOfTurns += 1
            playerTurnLabel.text = "Player \((playerTurn + 3) % 3 )'s turn"
            
            
            let row = canvasIndex / 3
            let column = canvasIndex % 3
            
            var sum1 = 0, sum2 = 0
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
            
            if (numberOfTurns > 9 && gameStart) {
                let alert = UIAlertController(title: "Winner", message: "It's a drawn game", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
    
    func showResult() {
        gameStart = false
        
        if playerTurn == -1  {
            let alert = UIAlertController(title: "Winner", message: "Player 1 Won", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Winner", message: "Player 2 Won", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func restartGamePressed(_ sender: Any) {
        playerTurn = 1
        playerTurnLabel.text = "Player \(playerTurn)'s turn"
        gameStart = true
        filledCanvas = Array(repeating: 0, count: 9)
        numberOfTurns = 1
        
        for index in 1...9 {
            if let button = view.viewWithTag(index) as? UIButton {
                button.setImage(nil, for: UIControlState.normal)
            }
        }
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
