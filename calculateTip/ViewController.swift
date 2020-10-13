//
//  ViewController.swift
//  calculateTip
//
//  Created by 万亦然 on 2020/10/13.
//  Copyright © 2020 Maraschino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlet
    @IBOutlet weak var sharedAmongLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var EachAmountLabel: UILabel!
    @IBOutlet weak var TotalAmountLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var sharedAmongSlider: UISlider!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.becomeFirstResponder()
    }
    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func sharedAmongSlide(_ sender: UISlider) {
        sharedAmongLabel.text = "Shared among \(Int(sender.value))"
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill, tip%, people
        let bill = Double(billTextField.text!) ?? 0
        let tipPercentage = Int(tipPercentageSlider.value)
        let sharedAmong = Int(sharedAmongSlider.value)
        
        // Calculate total and each
        let total = (1.00 + Double(tipPercentage)/100.00) * bill
        let each = total/Double(sharedAmong)
        
        // Update tip, shared, each, total labels
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        sharedAmongLabel.text = "Shared among \(Int(sharedAmong))"
        TotalAmountLabel.text = String(format: "$%.2f", total)
        EachAmountLabel.text = String(format: "$%.2f", each)
    }
    



    
}

