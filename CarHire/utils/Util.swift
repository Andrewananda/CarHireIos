//
//  Util.swift
//  CarHire
//
//  Created by Andrew Ananda on 29/06/2021.
//

import Foundation
import UIKit

func numberFormatter(number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    
    let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
    
    return formattedNumber!
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

func toastView(messsage : String, view: UIView ){
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150, y: view.frame.size.height-100, width: 300,  height : 35))
    toastLabel.backgroundColor = .systemGray
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(toastLabel)
        toastLabel.text = messsage
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
    UIView.animate(withDuration: 6.0, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            
        })
    }
