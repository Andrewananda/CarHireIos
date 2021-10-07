//
//  IntroViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 07/10/2021.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var btnSignIn : UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        btnSignIn.layer.borderWidth = 1
        btnSignIn.layer.borderColor = UIColor.white.cgColor
    }

}
