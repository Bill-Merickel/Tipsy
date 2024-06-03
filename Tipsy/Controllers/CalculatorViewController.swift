//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Double(billTextField.text!)!
        var tipAmount = 1.0
        if tenPctButton.isSelected {
            tipAmount = 1.1
        } else if twentyPctButton.isSelected {
            tipAmount = 1.2
        }
        let splitAmount = Double(splitNumberLabel.text!)!
        let amount = billTotal * tipAmount / splitAmount
        let amountToTwoPlaces = String(format: "%.2f", amount)
        print(amountToTwoPlaces)
    }
}

