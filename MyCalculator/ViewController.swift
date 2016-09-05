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
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        print("\(sender.currentTitle!) button pressed")
        calculatorDisplay.text = "Success!"
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

