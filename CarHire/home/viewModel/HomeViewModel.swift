//
//  HomeViewModel.swift
//  CarHire
//
//  Created by Andrew Ananda on 27/05/2021.
//

import Foundation

class HomeViewModel {
    
    private let homeRepository : HomeRepository
    
    init() {
        self.homeRepository = HomeRepository()
    }
    
    func fetchHomeData() {
        homeRepository.fetchHomeData()
    }
}
