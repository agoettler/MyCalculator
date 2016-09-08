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
            
            // TODO currently crashes due to unexpected nil if a binary operation is requested with only one operand on the stack
            
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
            
            print("result of \(operation) was \(result)")
            
            operandStack.push(result)
            
            print("Stack is " + operandStack.description())
            
            return result
            
        } else {
            print("Attempted to operate on an empty stack")
            return 0
        }
        
    }
    
    /*
    private func performBinaryOperation(operation: CalculatorOperation) -> Double {
        if !operandStack.isEmpty() {
            if let secondOperand: Double = operandStack.pop() {
                if let firstOperand: Double = operandStack.pop() {
                    
                } else {
                    
                }
            } else {
                
            }
        } else {
            
        }
    }
    */
    
    public func clearCalculator() {
        
        while !operandStack.isEmpty() {
            
            operandStack.pop()
            
        }
        
        print("Calculator stack cleared")
        print("Stack is " + operandStack.description())
    }
}
