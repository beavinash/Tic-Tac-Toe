//
//  UIViewExtension.swift
//  Tic-Tac-Toe
//
//  Created by Avinash Reddy on 6/21/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    // To animate the Rules 
    func pulsateRulesView() {
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.4
        pulsate.fromValue = 0.95
        pulsate.toValue = 1.00
        pulsate.damping = 1.0
        pulsate.autoreverses = true
        pulsate.repeatCount = 2
        pulsate.initialVelocity = 0.5
        
        layer.add(pulsate, forKey: nil)
    }
}
