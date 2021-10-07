//
//  SignInModel.swift
//  CarHire
//
//  Created by Andrew Ananda on 07/10/2021.
//

import Foundation

struct SignInResponse: Codable {
    var status: String
    var access_token: String
    var token_type: String
    var expires_in: Int
    var user: User?
}

struct User: Codable {
    var id: Int
    var name: String
    var email: String?
    var gender: String?
    var id_number: String?
    var phone: String?
    var email_verified_at : String?
    var created_at: String?
    var updated_at: String?
}
