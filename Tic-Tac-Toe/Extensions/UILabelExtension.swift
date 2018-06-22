//
//  UILabelExtension.swift
//  Tic-Tac-Toe
//
//  Created by Avinash Reddy on 6/21/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    // To animate the player turn UILabel
    func flashPlayerTurnLabel() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
}
