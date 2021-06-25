//
//  CarDetail.swift
//  CarHire
//
//  Created by Andrew Ananda on 24/06/2021.
//

import UIKit

class CarDetail: UIViewController {

    var labelText: String?
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = labelText {
            testLabel.text = text
        }
    }

}
