//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Muthukumar on 19/01/2020.
//  Copyright © 2020 Muthu. All rights reserved.
//

import Foundation

class TipsyBrain {
    
    func percentageCalculation(percentage:Double, totalAmount:Double) -> String {
        
        let amount = totalAmount * (Double(percentage)/100)
        let finalAmount = totalAmount - amount
        return String.init(format: "%.2f", finalAmount)
    }
    
}
