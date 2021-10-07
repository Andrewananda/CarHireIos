//
//  SigninViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 07/10/2021.
//

import UIKit
import RxRelay

class SigninViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var shouldNotChangeUserName = BehaviorRelay<Bool>(value: false)
    var shouldNotChangePassword = BehaviorRelay<Bool>(value: false)
    
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
        if shouldNotChangeUserName.value {
            if isUsernameValied() {
                if shouldNotChangePassword.value {
                    //Submit inputs
                    let username = txtUserName!.text
                    let password =  txtPassword!.text
                    viewModel.loginUser(username: username!, password: password!)
                }
            } else {
                //Enter valied email or phone number
                print("IsNotValied....")
                toastView(messsage: K.errorResponse.usernameOrPhoneError, view: self.view)
            }
        }else {
            //username cannot be empty
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
            if !shouldNotChangeUserName.value {
                shouldNotChangeUserName.accept(true)
                txtUserName.text = ""
                txtUserName.textColor = .black
            }
        case txtPassword:
            if !shouldNotChangePassword.value {
                shouldNotChangePassword.accept(true)
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
                shouldNotChangeUserName.accept(false)
            }else {
                shouldNotChangeUserName.accept(true)
            }
        case txtPassword:
            if txtPassword.text == "" {
                txtPassword.isSecureTextEntry =  false
                txtPassword.text = "Enter Password"
                txtPassword.textColor = .gray
                shouldNotChangePassword.accept(false)
            }else {
                shouldNotChangePassword.accept(true)
            }
        default:
            if txtPassword.text == "" {
                txtPassword.text = "Enter Password"
                txtPassword.textColor = .gray
            }
        }
    }
}
