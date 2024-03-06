//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Memory Mhou on 04/03/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var currentOperation: CalculatorModel.Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        clearValues()
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if !runningNumber.contains(".") {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        if let leftDouble = Double(leftValue),
           let rightDouble = Double(runningNumber),
           let operation = currentOperation {
            if let result = CalculatorModel.calculate(leftValue: leftDouble, rightValue: rightDouble, operation: operation) {
                if result.truncatingRemainder(dividingBy: 1) == 0 {
                    outputLabel.text = "\(Int(result))"
                } else {
                    outputLabel.text = "\(result)"
                }
                leftValue = "\(result)"
            } else {
                outputLabel.text = "Error"
            }
            runningNumber = ""
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if let number = Double(runningNumber),
           let operation = sender.titleLabel?.text {
            leftValue = runningNumber
            runningNumber = ""
            outputLabel.text = operation
            switch operation {
            case "+":
                currentOperation = .add
            case "-":
                currentOperation = .subtract
            case "×":
                currentOperation = .multiply
            case "÷":
                currentOperation = .divide
            default:
                break
            }
        }
    }
    
    func clearValues() {
        runningNumber = ""
        leftValue = ""
        currentOperation = nil
        outputLabel.text = "0"
    }
}
