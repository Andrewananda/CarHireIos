//
//  HomeRepository.swift
//  CarHire
//
//  Created by Andrew Ananda on 27/05/2021.
//

import Foundation
import RxSwift

class HomeRepository {
    
    let apiService = NetworkService()

    
    
    func fetchHomeData() {
        apiService.fetchData(url: "home", method: .get) {
            (response : Swift.Result<ApiResponse<HomeResponse>, Errors>) in
            switch response {
            case .success(let data) :
                print("Data \(data.message)")
            case .failure(let error) :
                print("Error \(error)")
            }
        }
    }
}
