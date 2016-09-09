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
    
    public func performOperation(operation: CalculatorOperation) -> String {
        
        if let result: Double = operation.performOperation(operandStack: operandStack) {
            
            print("result of \(operation) was \(result)")
            
            operandStack.push(result)
            
            print("Stack is " + operandStack.description())
            
            return String(result)
            
        } else {
            
            // return an error message
            return "Error"
            
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
