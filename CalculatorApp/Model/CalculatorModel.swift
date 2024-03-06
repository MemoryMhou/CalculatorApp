//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by Memory Mhou on 05/03/2024.
//

import Foundation

struct CalculatorModel {
    
    enum Operation {
        case add
        case subtract
        case multiply
        case divide
    }
    
    static func calculate(leftValue: Double, rightValue: Double, operation: Operation) -> Double? {
        
        switch operation {
            
        case .add:
            return leftValue + rightValue
        case .subtract:
            return leftValue - rightValue
        case .multiply:
            return leftValue * rightValue
        case .divide:
            if rightValue != 0 {
                return leftValue / rightValue
            } else {
                return nil
            }
        }
    }
}
