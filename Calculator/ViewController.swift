//
//  ViewController.swift
//  Calculator
//
//  Created by Abhishek Thakur on 23/04/19.
//  Copyright © 2019 Abhishek Thakur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentOperation:Operator = Operator.Nothing
    var calcState: CalculationState = CalculationState.enteringNum
    var firstValue: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var resultLabel: UILabel!
    //Button Action
    @IBAction func numberClicked(_ sender: UIButton){
        updateDisplay (number: String(sender.tag))
    }
    func updateDisplay(number: String){
        if calcState == CalculationState.newNumStarted{
            if let num = resultLabel.text {
                if num != ""{
                    firstValue=num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
        }
    }
    @IBAction func operatorClicked(_ sender: UIButton){
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        updateOperatorButton(tag: sender.tag)
        switch sender.tag {
        case 10:
            currentOperation = Operator.Add
        case 11:
            currentOperation = Operator.Subtract
        case 12:
            currentOperation = Operator.Multipy
        case 13:
            currentOperation = Operator.Divide
        default:
            return
        }
    }
    @IBAction func equalsClicked(_ sender: UIButton){
        calculate()
        
    }
    func calculate() {
        valueCheck()
        var result = ""
        if currentOperation == Operator.Add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Subtract {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Multipy {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.Divide {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }
    func valueCheck() {
        if firstValue.isEmpty {
            return
        }
    }
    func updateOperatorButton (tag: Int) {
        //clear colors
        for var i in 10..<14{
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        //Change Color
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellow
        }
    }

}

