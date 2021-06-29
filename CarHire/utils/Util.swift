//
//  Util.swift
//  CarHire
//
//  Created by Andrew Ananda on 29/06/2021.
//

import Foundation

func numberFormatter(number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    
    let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
    
    return formattedNumber!
}
