//
//  ViewController.swift
//  MyCalculator
//
//  Created by Andrew Goettler on 9/1/16.
//  Copyright © 2016 Andrew Goettler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var entriesDisplay: UILabel!
    
    
    var userIsEnteringNumber: Bool = false
    var decimalEntered: Bool = false
    var isDisplayingResult: Bool = false
    var calculatorModel: RPNCalculatorModel = RPNCalculatorModel()
    let operationsDictionary = ["+" : CalculatorOperation.addition, "-" : CalculatorOperation.subtraction, "×" : CalculatorOperation.multiplication, "÷" : CalculatorOperation.division, "√" : CalculatorOperation.squareRoot, "π" : CalculatorOperation.pi, "sin" : CalculatorOperation.sine, "cos" : CalculatorOperation.cosine, "±" : CalculatorOperation.negation]
    
    let calculatorDisplayReturnedNil = "calculatorDisplay returned nil"
    let entriesDisplayReturnedNil = "entriesDisplay returned nil"
    
    @IBAction func digitPressed(_ sender: AnyObject) {
        
        // let's try this optional binding thing
        if let digitEntered: String = sender.currentTitle {
            
            print("Digit button '\(digitEntered)' was pressed")
            
            if let currentDisplayText: String = calculatorDisplay.text {
                
                if !isDisplayingResult && userIsEnteringNumber {
                    
                    calculatorDisplay.text = currentDisplayText + digitEntered
                    
                } else {
                    
                    userIsEnteringNumber = true
                    isDisplayingResult = false
                    
                    calculatorDisplay.text = digitEntered
                    
                }
                
            } else {
                print(calculatorDisplayReturnedNil)
            }
            
        } else {
            
            print("nil value received")
            
        }
        
    }

    @IBAction func operationPressed(_ sender: AnyObject) {
        
        if let operationEntered: String = sender.currentTitle {
            
            print("Operation button '\(operationEntered)' was pressed")
            
            if let operation: CalculatorOperation = operationsDictionary[operationEntered] {
                
                // don't repeat yourself!
                // doesn't need arguments since all variables necessary are in scope
                func resolveOperation() {
                    
                    let result: String = calculatorModel.performOperation(operation: operation)
                    
                    calculatorDisplay.text = "\(result)"
                    
                    appendToEntriesList(nextEntry: operationEntered)
                    
                    isDisplayingResult = true
                    
                }
                
                if userIsEnteringNumber {
                    
                    // if the user presses negation while entering a number, negate the value in the display
                    if operation == .negation {
                        
                        if let currentDisplayText: String = calculatorDisplay.text {
                            
                            calculatorDisplay.text = "-" + currentDisplayText
                            
                        } else {
                            
                            print(calculatorDisplayReturnedNil)
                            
                        }
                        
                    } else {
                        
                        // if the user presses any other operation while entering a number, push the number onto the stack and perform computation
                        self.enterPressed()
                        
                        resolveOperation()
                        
                    }
                    
                    
                } else {
                    
                    resolveOperation()
                }
                    

                
            } else {
                
                print("No valid operation found")
                
            }
            
        } else {
            
            print("operationEntered received a nil value from the sender")
            
        }
            
    }
    
    @IBAction func enterPressed() {
        print("Enter button pressed")
        if let currentDisplayText: String = calculatorDisplay.text {
            
            if let number: Double = Double(currentDisplayText) {
                
                userIsEnteringNumber = false
                
                decimalEntered = false
                
                isDisplayingResult = true
                
                print("Value '\(number)' sent to model")
                
                calculatorModel.enterNumber(number: number)
                
                appendToEntriesList(nextEntry: currentDisplayText)
                
            } else {
                
                print("Entered value could not be converted to float")
                
                calculatorDisplay.text = "0"
                
            }
        }
    }

    
    @IBAction func backSpacePressed(_ sender: AnyObject) {
        print("Backspace button pressed")
    }
    
    @IBAction func clearPressed(_ sender: AnyObject) {
        print("Clear button pressed")
        
        calculatorModel.clearCalculator()
        
        calculatorDisplay.text = "0"
        
        entriesDisplay.text = ""
        
        decimalEntered = false
        
        userIsEnteringNumber = false
        
        isDisplayingResult = false
    }
    
    @IBAction func decimalPressed(_ sender: AnyObject) {
        print("Decimal button pressed")
        if let currentDisplayText: String = calculatorDisplay.text {
            
            if !isDisplayingResult && !decimalEntered {
                
                decimalEntered = true
                
                userIsEnteringNumber = true
                
                calculatorDisplay.text = currentDisplayText + "."
                
            }
            
        } else {
            
            print(calculatorDisplayReturnedNil)
            
        }
    }
    
    func appendToEntriesList(nextEntry: String) {
        if let currentEntryList: String = entriesDisplay.text {
            entriesDisplay.text = currentEntryList + " " + nextEntry
        } else {
            print(entriesDisplayReturnedNil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

