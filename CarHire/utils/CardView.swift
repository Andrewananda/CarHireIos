//
//  CardView.swift
//  CarHire
//
//  Created by Andrew Ananda on 24/06/2021.
//

import Foundation
import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var connerRadius: CGFloat = 10
    @IBInspectable var ofsetWidth: CGFloat = 5
    var ofsetHeight: CGFloat = 5
    @IBInspectable var ofsetShaddowOpacity: Float = 8
    @IBInspectable var color: UIColor = UIColor.systemGray6
    
    override func layoutSubviews() {
        layer.cornerRadius = self.connerRadius
        layer.shadowColor = self.color.cgColor
        layer.shadowOffset = CGSize(width: self.ofsetWidth, height: self.ofsetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.connerRadius).cgPath
        layer.shadowOpacity = self.ofsetShaddowOpacity
    }
}
