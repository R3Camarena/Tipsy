//
//  ViewController.swift
//  Tipsy
//
//  Created by Ricardo Camarena on 05/09/2022.
//  Copyright © 2022 Ricardo Camarena. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var people = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let tipSelected = sender.currentTitle! // 0% - 10% - 20% : String
        let removePercentage =  tipSelected.dropLast() // 0 - 10 - 20 : String
        let tipToDouble = Double(removePercentage)! // 0 - 10 - 20 : Double
        tip = tipToDouble / 100

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value) // 2 : String
        people = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = (((billTotal * tip) + billTotal) / Double(people))
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            
            let resultVC = segue.destination as! ResultsViewController
            
            resultVC.result = finalResult
            resultVC.tip = Int(tip * 100)
            resultVC.split = people
        }
    }
}
