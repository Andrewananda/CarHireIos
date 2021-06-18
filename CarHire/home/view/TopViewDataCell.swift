//
//  TopViewCell.swift
//  CarHire
//
//  Created by Andrew Ananda on 12/06/2021.
//

import UIKit
import SDWebImage

class TopViewDataCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
   }
    
    func loadImage(url: String) {
        let imageUrl = K.api.imageUrl + url
        imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "cars"))
    }
   
}
