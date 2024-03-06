//
//  RoundButton.swift
//  CalculatorApp
//
//  Created by Memory Mhou on 04/03/2024.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
 
    @IBInspectable var roundButton:Bool = false {
        didSet {
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height/2
            
        }
    }
    
}
