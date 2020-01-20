//
//  ViewController.swift
//  Tipsy
//
//  Created by Muthukumar on 17/01/2020.
//  Copyright © 2020 Muthu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var headCountLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    
    let tipsyBrain = TipsyBrain()
    var whichButtonSelected = 0
    var amountAfterDiscount = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        countStepper.maximumValue = 12
        countStepper.minimumValue = 1
        
    }
    
    @IBAction func btnCalculatePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "resultIdentifier", sender:self )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultIdentifier" {
            let rVc   = segue.destination as! ResultViewController
            rVc.discountPercentage = String(whichButtonSelected)
            let value = Double.init((String(self.billTextField.text!)))
            if value  != nil && value! > 0.0 {
                if whichButtonSelected == 0 {
                    amountAfterDiscount = String.init(format: "%.2f", value!)
                } else {
                    amountAfterDiscount = tipsyBrain.percentageCalculation(percentage: Double(whichButtonSelected), totalAmount: value!)
                    print(amountAfterDiscount)
                }
            } else {
                print("Please enter the amount")
            }
            
            
            rVc.headCount = headCountLabel.text!
            rVc.amountAfterDiscount = amountAfterDiscount
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton){
        
        switch  sender.titleLabel?.text {
        case "0%" :
            whichButtonSelected = 0
            zeroButton.isSelected  = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
        case "10%" :
            whichButtonSelected = 10
            tenButton.isSelected  = true
            twentyButton.isSelected = false
            zeroButton.isSelected  = false
        case "20%" :
            whichButtonSelected = 20
            twentyButton.isSelected  = true
            tenButton.isSelected = false
            zeroButton.isSelected  = false
        default:
            whichButtonSelected = 0
            zeroButton.isSelected  = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        headCountLabel.text = Int(sender.value).description
    }
}

