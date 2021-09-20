//
//  FeaturedCarViewCell.swift
//  CarHire
//
//  Created by Andrew Ananda on 12/06/2021.
//

import UIKit
import SDWebImage

class FeaturedCarViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var plateNumber: UILabel!
    @IBOutlet weak var featuredCarImage: UIImageView!
    @IBOutlet weak var amount: UILabel!
    
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadImage(url: String) {
        let imageUrl = K.api.imageUrl + url
        featuredCarImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "cars"))
    }
    
}
