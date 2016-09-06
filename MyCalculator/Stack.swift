//
//  Stack.swift
//  MyCalculator
//
//  Created by Andrew Goettler on 9/6/16.
//  Copyright © 2016 Andrew Goettler. All rights reserved.
//

import Foundation

// following along with the tutorial in the Generics chapter of "The Swift ProgrammingLanguage", p. 806
class Stack<Element> {
    
    private var items = [Element]()
    
    // pushes an item onto the stack
    func push(_ item: Element) {
        
        items.append(item)
        
    }
    
    // pops an item off of the stack
    func pop() -> Element? {
        
        return self.isEmpty() ? nil : items.removeLast()
        
    }
    
    // returns the top item without removing it from the stack
    func peek() -> Element? {
        
        return self.isEmpty() ? nil : items.last
        
    }
    
    // returns true if the stack is empty
    func isEmpty() -> Bool {
        
        return items.isEmpty
        
    }
    
    // this syntax will be a little too like java
    func description() -> String {
        return items.description
    }
    
}
