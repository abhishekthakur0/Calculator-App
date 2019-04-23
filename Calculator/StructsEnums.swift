//
//  StructsEnums.swift
//  Calculator
//
//  Created by Abhishek Thakur on 24/04/19.
//  Copyright © 2019 Abhishek Thakur. All rights reserved.
//

import Foundation

enum Operator:String {
    case Add = "+"
    case Subtract = "-"
    case Multipy = "*"
    case Divide = "/"
    case Nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
