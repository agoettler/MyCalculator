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
    var currentlyEnteringNumber: Bool = false
    
    @IBAction func digitPressed(_ sender: AnyObject) {
        
        // let's try this optional binding thing
        if let digitEntered:String = sender.currentTitle {
            
            print("Digit button '\(digitEntered)' was pressed")
            
            if let currentDisplayText: String = calculatorDisplay.text {
                
                if currentlyEnteringNumber {
                    
                    calculatorDisplay.text = currentDisplayText + digitEntered
                    
                } else {
                    
                    currentlyEnteringNumber = true
                    
                    calculatorDisplay.text = digitEntered
                    
                }
                
            } else {
                print("calculatorDisplay text returned nil")
            }
            
        } else {
            
            print("'Nil' value received")
            
        }
        
        // more stuff happens here
    }

    @IBAction func operationPressed(_ sender: AnyObject) {
        
        if let operationEntered:String = sender.currentTitle {
            
            print("Operation button '\(operationEntered)' was pressed")
            
        } else {
            
            print("'Nil' value received")
            
        }
       
        // more stuff happens here
    }
  
    
    @IBAction func enterPressed(_ sender: AnyObject) {
        print("Enter button pressed")
    }
    
    @IBAction func backSpacePressed(_ sender: AnyObject) {
        print("Backspace button pressed")
    }
    
    @IBAction func clearPressed(_ sender: AnyObject) {
        print("Clear button pressed")
    }
    
    @IBAction func decimalPressed(_ sender: AnyObject) {
        print("Decimal button pressed")
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

