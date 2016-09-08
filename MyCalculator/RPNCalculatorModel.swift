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
        
        // don't do an operation if the stack is empty
        if !operandStack.isEmpty() {
            let result: Double
            
            result = operation.performOperation(operandStack: operandStack)
            
            print("result of \(operation) was \(result)")
            
            operandStack.push(result)
            
            print("Stack is " + operandStack.description())
            
            return result
            
            // TODO currently crashes due to unexpected nil if a binary operation is requested with only one operand on the stack
            
            /*
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
                result = operation.computeSine(operandStack.pop()!)
            case .cosine:
                result = operation.compueCosine(operandStack.pop()!)
            case .pi:
                result =  operation.piValue()
            }
            
            */
            
        } else {
            print("Attempted to operate on an empty stack")
            return 0
        }
        
    }
    
    public func clearCalculator() {
        
        while !operandStack.isEmpty() {
            
            // this is a little clumsy, could be changed later
            operandStack.pop()
            
        }
        
        print("Calculator stack cleared")
        print("Stack is " + operandStack.description())
    }
}
