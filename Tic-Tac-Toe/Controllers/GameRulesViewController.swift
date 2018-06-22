//
//  GameRulesViewController.swift
//  Tic-Tac-Toe
//
//  Created by Avinash Reddy on 6/19/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import UIKit

class GameRulesViewController: UIViewController {
    
    // This IBOutlet variable used for animation of UIStackView
    @IBOutlet weak var animateRulesStackView: UIStackView!
    
    // MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Animate Rules View
        animateRulesStackView.pulsateRulesView()
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
