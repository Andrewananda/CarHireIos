//
//  HomeResponse.swift
//  CarHire
//
//  Created by Andrew Ananda on 27/05/2021.
//

import Foundation

struct HomeResponse : Codable {
    var featured_car: [FeaturedCar]?
    var top_deals: [FeaturedCar]?
}

struct FeaturedCar : Codable {
    let id : Int
    let name: String
    let model_id: String
    let year: String
    let hire_duration_id: Int
    let number_of_seats : String
    let number_plate: String
    let photo: String?
    let price : Int
    let status: String
    let remember_token : String?
    let created_at: String?
    let update_at: String?
    let hire_duration : HireDuration?
    let model: Model?
}

struct HireDuration: Codable {
    let id: Int
    let name: String
    let description: String?
    let created_at: String?
    let updated_at: String?
}

struct Model: Codable {
    let id: Int
    let title: String
    let description: String?
    let remember_token: String?
    let created_at: String?
    let updated_at: String?
}
