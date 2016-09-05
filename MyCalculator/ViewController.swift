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
    
    @IBAction func digitPressed(_ sender: AnyObject) {
        let title: String? = sender.currentTitle!
        print("\(title) button pressed")
        calculatorDisplay.text = title
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

