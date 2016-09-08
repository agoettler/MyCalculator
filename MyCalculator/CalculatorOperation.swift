//
//  Operations.swift
//  MyCalculator
//
//  Created by Andrew Goettler on 9/5/16.
//  Copyright © 2016 Andrew Goettler. All rights reserved.
//

import Foundation

public enum CalculatorOperation {
    
    case addition, subtraction, multiplication, division, squareRoot, pi, sine, cosine, negation
    
    // functions for calculator operations are defined here in the enumeration
    
    public func performOperation(operandStack: Stack<Double>) -> Double {
        
        let result: Double
        
        switch self {
            
        case .addition, .subtraction, .multiplication, .division:
           result = performBinaryOperation(operandStack: operandStack)
            
        case .squareRoot, .sine, .cosine, .negation:
            result =  performUnaryOperation(operationStack: operandStack)
            
        case .pi:
            
            result = performNoOperandOperation(operationStack: operandStack)
        }
        
        return result
    }
    
    private func performBinaryOperation(operandStack: Stack<Double>) -> Double {
        let result: Double
        
        if let secondOperand: Double = operandStack.pop() {
            if let firstOperand: Double = operandStack.pop() {
                switch self {
                case .addition:
                    result = self.add(firstOperand, secondOperand)
                case .subtraction:
                    result = self.subtract(firstOperand, secondOperand)
                case .multiplication:
                    result = self.multiply(firstOperand, secondOperand)
                case .division:
                    result = self.divide(firstOperand, secondOperand)
                default:
                    print("Attempted to perform binary operation")
                    // TODO returning 0 here is poor practice
                    result = 0
                }
            
            // if only one operand was found on the stack, use 0 for the next operand
            } else {
                let firstOperand: Double = 0
                
                switch self {
                case .addition:
                    result = self.add(firstOperand, secondOperand)
                case .subtraction:
                    result = self.subtract(firstOperand, secondOperand)
                case .multiplication:
                    result = self.multiply(firstOperand, secondOperand)
                case .division:
                    result = self.divide(firstOperand, secondOperand)
                default:
                    print("Attempted to perform an invalid binary operation")
                    // TODO returning 0 here is poor practice
                    result = 0
                }
            }
        } else {
            print("Attempted to perform binary operation, but no operands were found on the stack")
            // TODO returning 0 here is still a bad idea
            result = 0
            
        }
        return result
    }
    
    private func performUnaryOperation(operationStack: Stack<Double>) -> Double {
        let result: Double
        
        if let operand: Double = operationStack.pop() {
            switch self {
            case .squareRoot:
                result = self.findSquareRoot(operand)
            case .sine:
                result = self.computeSine(operand)
            case .cosine:
                result = self.compueCosine()
            case .negation:
                result = self.negate(operand)
            default:
                print("Attempted to perform an invalid unary operation")
                // TODO this continues to be stupid
                result = 0
            }
        
            // not sure this is necessary, a 0 may be pushed on the stack prior to performing an operation anyway
        } else {
            let operand: Double = 0
            
            switch self {
            case .squareRoot:
                result = self.findSquareRoot(operand)
            case .sine:
                result = self.computeSine(operand)
            case .cosine:
                result = self.compueCosine()
            case .negation:
                result = self.negate(operand)
            default:
                print("Attempted to perform an invalid unary operation")
                // TODO this continues to be stupid
                result = 0
            }

        }
        
        return result
    }
    
    // doesn't need the stack, but included so function types match
    private func performNoOperandOperation(operationStack: Stack<Double>) -> Double {
        let result: Double
        
        switch self {
        case .pi:
            result = self.piValue()
        default:
            print("Attempted to perform an invalid no-operand operation")
            // TODO insanity is doing the same thing over and over again while expecting different results
            result = 0
        }
        return result
    }
    
    private func add(_ firstAddend: Double = 0, _ secondAddend: Double = 0) -> Double {
        return firstAddend + secondAddend
    }
    
    private func subtract(_ minuend: Double = 0, _ subtrahend: Double = 0) -> Double {
        return minuend - subtrahend
    }
    
    private func multiply(_ multiplier: Double = 0, _ multiplicand: Double = 0) -> Double {
        return multiplier * multiplicand
    }
    
    private func divide(_ dividend: Double = 0, _ divisor: Double = 1) -> Double {
        return dividend / divisor
    }
    
    private func findSquareRoot(_ square: Double = 0) -> Double {
        return sqrt(square)
    }
    
    private func piValue() -> Double {
        return Double.pi
    }
    
    private func computeSine(_ angle: Double = 0) -> Double {
        // TODO apparently Swift's sine function is goofy with floating point, look into this later
        return sin(angle)
    }
    
    private func compueCosine(_ angle: Double = 0) -> Double {
        // TODO look at this later
        return cos(angle)
    }
    
    private func negate(_ number: Double = 0) -> Double {
        return -number
    }
    

    
}
