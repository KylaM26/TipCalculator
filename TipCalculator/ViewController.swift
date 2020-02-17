//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kyla Wilson on 2/17/20.
//  Copyright © 2020 Kyla Wilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tipLbl: UILabel!
    @IBOutlet private weak var totalLbl: UILabel!
    @IBOutlet private weak var billTxtField: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    private let tipPercentages = [0.15, 0.18, 0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddGestureRecongizer()
    }

    private func AddGestureRecongizer() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard)))
    }
    
    @objc private func DismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction private func CalculateTip(_ sender: Any) {
        let billAmount = Double(billTxtField.text!) ?? 0
        let tip = billAmount * tipPercentages[segmentedControl.selectedSegmentIndex]
        let total = billAmount + tip
        
        tipLbl.text = String(format: "$%.2f", tip)
        totalLbl.text = String(format: "$%.2f",total)
    }
}

