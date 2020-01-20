//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Muthukumar on 17/01/2020.
//  Copyright © 2020 Muthu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    var headCount : String = "0.0"
    var amountAfterDiscount : String!
    var discountPercentage : String!
    
    override func viewDidLoad() {
        
        let perHead = String(format:  "%.2f",Double.init(amountAfterDiscount)! / Double.init(headCount)!)
        print(perHead)
        resultLabel.text = String("$\(perHead)")
        percentageLabel.text = "Split between \(headCount) with \(String(describing: discountPercentage!))%  "
    }
    
    @IBAction func reCalculatePressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
