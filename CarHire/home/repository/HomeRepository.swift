//
//  HomeRepository.swift
//  CarHire
//
//  Created by Andrew Ananda on 27/05/2021.
//

import Foundation
import RxSwift
import RxRelay

class HomeRepository {
    
    let apiService = NetworkService()
    let homeSubject = PublishRelay<HomeResponse>()
    
    func fetchHomeData() {
        apiService.fetchData(url: "home", method: .get) { [weak self]
            (response : Swift.Result<ApiResponse<HomeResponse>, Errors>) in
            switch response {
            case .success(let data) :
                self?.homeSubject.accept(data.data)
                print("Data \(data.data)")
            case .failure(let error) :
                print("Error \(error)")
            }
        }
    }
}
