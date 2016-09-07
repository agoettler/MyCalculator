//
//  CalculatorModel.swift
//  MyCalculator
//
//  Created by Andrew Goettler on 9/5/16.
//  Copyright © 2016 Andrew Goettler. All rights reserved.
//

import Foundation

public class RPNCalculatorModel {
    
    private var operandStack: Stack<Double> = Stack<Double>()
    
    public func enterNumber(number: Double) {
        
        operandStack.push(number)
        
        print("Stack is " + operandStack.description())
    }
    
    public func performOperation(operation: CalculatorOperation) -> Double {
        
        let result: Double
        
        switch operation {
        case .addition:
            result =  operation.add(operandStack.pop()!, operandStack.pop()!)
        case .subtraction:
            let secondOperand = operandStack.pop()!
            let firstOperand = operandStack.pop()!
            result = operation.subtract(firstOperand, secondOperand)
        case .multiplication:
            result = operation.multiply(operandStack.pop()!, operandStack.pop()!)
        case .division:
            let secondOperand = operandStack.pop()!
            let firstOperand = operandStack.pop()!
            result = operation.divide(firstOperand, secondOperand)
        case .negation:
            result = operation.negate(operandStack.pop()!)
        case .squareRoot:
            result = operation.findSquareRoot(operandStack.pop()!)
        case .sine:
            result = 0
        case .cosine:
            result = 0
        case .pi:
            result =  operation.piValue()
        }
        
        print("result of \(operation) was \(result)")
        
        operandStack.push(result)
        
        print("Stack is " + operandStack.description())
        
        return result
        
    }
    
    public func clearCalculator() {
        while !operandStack.isEmpty() {
            operandStack.pop()
        }
    }
}
