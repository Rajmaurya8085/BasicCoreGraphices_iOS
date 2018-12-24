//
//  ViewController.swift
//  BasicCoreGraphices_iOS
//
//  Created by Raj on 23/12/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: DesignableUIView!
    @IBOutlet weak var ounterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func pulseButtonAction(_ sender: DesignableCustomButton) {
        if sender.isAdd{
            if counterView.counter < numberOfItem{
            counterView.counter  = counterView.counter + 1
            }
        }else{
            if counterView.counter  > 0{
            counterView.counter = counterView.counter - 1
            }
        }
         ounterLabel.text = String(counterView.counter)
    }
    
    
}

