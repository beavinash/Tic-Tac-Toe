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
    
    // This variable will keep track of player turns in a game
    var playerTurn: Int = 1
    
    
    // MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Tic Tac Toe custom functions
    @IBAction func playButtonPressed(_ sender: AnyObject) {
        if playerTurn == 1 {
            sender.setImage(UIImage(named: "X"), for: [])
            playerTurn = 2
        } else {
            sender.setImage(UIImage(named: "O"), for: UIControlState.normal)
            playerTurn = 1
        }
    }
    
    @IBAction func restartGamePressed(_ sender: Any) {
        
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
