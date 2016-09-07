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
    var userIsEnteringNumber: Bool = false
    var decimalEntered: Bool = false
    var calculatorModel: RPNCalculatorModel = RPNCalculatorModel()
    let operationsDictionary = ["+" : CalculatorOperation.addition, "-" : CalculatorOperation.subtraction, "×" : CalculatorOperation.multiplication, "÷" : CalculatorOperation.division, "√" : CalculatorOperation.squareRoot, "π" : CalculatorOperation.pi, "sin" : CalculatorOperation.sine, "cos" : CalculatorOperation.cosine, "±" : CalculatorOperation.negation]
    
    let calculatorDisplayReturnedNil = "calculatorDisplay returned nil"
    
    @IBAction func digitPressed(_ sender: AnyObject) {
        
        // let's try this optional binding thing
        if let digitEntered: String = sender.currentTitle {
            
            print("Digit button '\(digitEntered)' was pressed")
            
            if let currentDisplayText: String = calculatorDisplay.text {
                
                if userIsEnteringNumber {
                    
                    calculatorDisplay.text = currentDisplayText + digitEntered
                    
                } else {
                    
                    userIsEnteringNumber = true
                    
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
                
                if userIsEnteringNumber {
                    
                    // if the user presses negation while entering a number, negate the value in the display
                    if operation == .negation {
                        
                        if let currentDisplayText: String = calculatorDisplay.text {
                            
                            calculatorDisplay.text = "-" + currentDisplayText
                            
                        } else {
                            
                            print(calculatorDisplayReturnedNil)
                            
                        }
                        
                    } else {
                        
                        // if the user presses any other operation while entering a number, push the number onto the stack
                        self.enterPressed()
                        
                    }
                    
                    
                } else {
                    
                    let result: Double = calculatorModel.performOperation(operation: operation)
                    
                    print("Performed \(operationsDictionary[operationEntered]!)")
                    
                    // set decimal entered to true to prevent the user from appending a second decimal
                    decimalEntered = true
                    
                    calculatorDisplay.text = "\(result)"
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
                
                print("Value '\(number)' sent to model")
                
                calculatorModel.enterNumber(number: number)
                
            } else {
                
                print("Entered value could not be converted to float")
                
            }
        } else {
            
            print(calculatorDisplayReturnedNil)
            
        }
    }
    
    @IBAction func backSpacePressed(_ sender: AnyObject) {
        print("Backspace button pressed")
    }
    
    @IBAction func clearPressed(_ sender: AnyObject) {
        print("Clear button pressed")
    }
    
    @IBAction func decimalPressed(_ sender: AnyObject) {
        print("Decimal button pressed")
        if let currentDisplayText: String = calculatorDisplay.text {
            
            if !decimalEntered {
                
                decimalEntered = true
                
                calculatorDisplay.text = currentDisplayText + "."
                
            }
            
        } else {
            
            print(calculatorDisplayReturnedNil)
            
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

