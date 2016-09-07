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
    
    func add(_ firstAddend: Double, _ secondAddend: Double) -> Double {
        return firstAddend + secondAddend
    }
    
    func subtract(_ minuend: Double, _ subtrahend: Double) -> Double {
        return minuend - subtrahend
    }
    
    func multiply(_ multiplier: Double, _ multiplicand: Double) -> Double {
        return multiplier * multiplicand
    }
    
    func divide(_ dividend: Double, _ divisor: Double) -> Double {
        return dividend / divisor
    }
    
    func findSquareRoot(_ square: Double) -> Double {
        return sqrt(square)
    }
    
    func piValue() -> Double {
        return Double.pi
    }
    
    func computeSine(_ angle: Double) -> Double {
        // TODO apparently Swift's sine function is goofy with floating point, look into this later
        return 0
    }
    
    func compueCosine(_ angle: Double) -> Double {
        // TODO look at this later
        return 0
    }
    
    func negate(_ number: Double) -> Double {
        return -number
    }
    
}
