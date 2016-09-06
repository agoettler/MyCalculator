//
//  CalculatorModel.swift
//  MyCalculator
//
//  Created by Andrew Goettler on 9/5/16.
//  Copyright © 2016 Andrew Goettler. All rights reserved.
//

import Foundation

class RPNCalculatorModel {
    
    private var operandStack: Stack<Double> = Stack<Double>()
    
    func enterNumber(number: Double) {
        operandStack.push(number)
        print("Stack is " + operandStack.description())
    }
    
}
