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
    
    func add(_ firstAddend: Double = 0, _ secondAddend: Double = 0) -> Double {
        return firstAddend + secondAddend
    }
    
    func subtract(_ minuend: Double = 0, _ subtrahend: Double = 0) -> Double {
        return minuend - subtrahend
    }
    
    func multiply(_ multiplier: Double = 0, _ multiplicand: Double = 0) -> Double {
        return multiplier * multiplicand
    }
    
    func divide(_ dividend: Double = 0, _ divisor: Double = 1) -> Double {
        return dividend / divisor
    }
    
    func findSquareRoot(_ square: Double = 0) -> Double {
        return sqrt(square)
    }
    
    func piValue() -> Double {
        return Double.pi
    }
    
    func computeSine(_ angle: Double = 0) -> Double {
        // TODO apparently Swift's sine function is goofy with floating point, look into this later
        return sin(angle)
    }
    
    func compueCosine(_ angle: Double = 0) -> Double {
        // TODO look at this later
        return cos(angle)
    }
    
    func negate(_ number: Double = 0) -> Double {
        return -number
    }
    
}
