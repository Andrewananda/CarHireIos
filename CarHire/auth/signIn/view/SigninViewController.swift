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
    
    var viewModel: SignInViewModel = SignInViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.delegate = self
        txtUserName.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        
        txtPassword.textColor = .gray
        txtUserName.textColor = .gray
    }

    @IBAction func btnSubmit(_ sender: Any) {
        validateInputs()
    }
    
    private func validateInputs() {
        if shouldNotChangeUserName {
            if isUsernameValied() {
                if shouldNotChangePassword {
                    //Submit inputs
                    print("UsernameTxt \(txtUserName.text)")
                    var username = txtUserName!.text
                    var password =  txtPassword!.text
                    viewModel.loginUser(username: username!, password: password!)
                }
            } else {
                //Enter valied email or phone number
                print("!SigningIn Repository.....")
                toastView(messsage: K.errorResponse.usernameOrPhoneError, view: self.view)
            }
        }else {
            //username cannot be empty
            print("!SigningIn Repository.....")
            toastView(messsage: K.errorResponse.usernameError, view: self.view)
        }
    }
    
    private func isUsernameValied() -> Bool{
        if let username = txtUserName.text {
            if username.isValidEmail() {
              return true
            }
            if username.isNumber {
                return true
            }
        }
        return false
    }
}

extension SigninViewController {
    
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
