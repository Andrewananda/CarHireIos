//
//  SigninViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 07/10/2021.
//

import UIKit

class SigninViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var shouldNotChangeUserName: Bool = false
    var shouldNotChangePassword: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.delegate = self
        txtUserName.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        
        txtPassword.textColor = .gray
        txtUserName.textColor = .gray
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case txtUserName:
            if !shouldNotChangeUserName {
                txtUserName.text = ""
                txtUserName.textColor = .black
            }
        case txtPassword:
            if !shouldNotChangePassword {
                txtPassword.text = ""
                txtPassword.isSecureTextEntry = true
                txtPassword.textColor = .black
            }
        default:
            txtPassword.text = ""
            txtPassword.textColor = .black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case txtUserName:
            if txtUserName.text == "" {
                txtUserName.text = "Enter Email / Phone"
                txtUserName.textColor = .gray
                shouldNotChangeUserName = false
            }else {
                shouldNotChangeUserName = true
            }
        case txtPassword:
            if txtPassword.text == "" {
                txtPassword.isSecureTextEntry =  false
                txtPassword.text = "Enter Password"
                txtPassword.textColor = .gray
                shouldNotChangePassword = false
            }else {
                shouldNotChangePassword = true
            }
        default:
            if txtPassword.text == "" {
                txtPassword.text = "Enter Password"
                txtPassword.textColor = .gray
            }
        }
    }

}
