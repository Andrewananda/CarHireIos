//
//  HomeViewModel.swift
//  CarHire
//
//  Created by Andrew Ananda on 27/05/2021.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel {

    private let homeSubject = PublishSubject<HomeResponse>()
    var homeLiveData: Observable<HomeResponse> {
        return homeSubject.asObserver()
    }
    private let homeRepository : HomeRepository
    
    init() {
        self.homeRepository = HomeRepository()
    }
    
    func fetchHomeData() {
        homeRepository.homeSubject.subscribe { [weak self] response in
            self?.homeSubject.onNext(response)
        }
        homeRepository.fetchHomeData()
    }
}
