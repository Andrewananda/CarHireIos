//
//  SignInViewModl.swift
//  CarHire
//
//  Created by Andrew Ananda on 07/10/2021.
//

import Foundation

class SignInViewModel {
    private var repository: SignInRepository = SignInRepository()
    
    func loginUser(username: String, password: String) {
        let user = [
            "username": username,
            "password": password
        ]
        print("SigningIn Repository.....")
        repository.signInUser(params: user)
    }
}
