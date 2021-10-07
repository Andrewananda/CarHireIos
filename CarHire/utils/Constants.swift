//
//  Constants.swift
//  CarHire
//
//  Created by Andrew Ananda on 19/05/2021.
//

import Foundation

struct K {
    struct api {
      static let baseUrl = "http://carhire.devstart.co.ke/api/"
      static let home = "home"
      static let imageUrl = "http://carhire.devstart.co.ke/portal/storage/app/public/images/"
    }
    struct viewConstants{
        static let reusableFeaturedCarCell = "featuredCarCell"
        static let topDealsCell = "topDealsRusableCell"
        static let carDetailSegue = "CarDetailView"
        static let enquirySegue = "enquirySegue"
        static let signUpSegue = "signUpSegue"
        static let signInSegue = "signInSegue"
        
    }
    
    struct errorResponse {
        static let usernameError = "Username field cannot be empty"
        static let usernameOrPhoneError = "Enter a valid email or phone number"
        static let passwordError = "Password field cannot be empty"
    }
}
