//
//  EnquiryViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 29/06/2021.
//

import UIKit

class EnquiryViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var enquiryDesctiption: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enquiryDesctiption.delegate = self
        enquiryDesctiption.textColor = .lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        enquiryDesctiption.text = ""
        enquiryDesctiption.textColor = .black
    }

}
