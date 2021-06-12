//
//  TopViewCell.swift
//  CarHire
//
//  Created by Andrew Ananda on 12/06/2021.
//

import UIKit

class TopViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
   }
   
}
