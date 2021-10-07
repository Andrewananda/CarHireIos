//
//  SignInRepository.swift
//  CarHire
//
//  Created by Andrew Ananda on 07/10/2021.
//

import Foundation
import RxSwift
import RxRelay

class SignInRepository {
    let apiService = NetworkService()
    let signInSubject = PublishRelay<SignInResponse>()
    
    func signInUser(params: [String: Any]) {
        apiService.fetchData(url: "login", method: .post, params: params) {[weak self] (response: Swift.Result<SignInResponse, Errors>) in
            switch response {
            case .success(let data):
                print("SignInResponse \(data)")
                self?.signInSubject.accept(data)
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
}
