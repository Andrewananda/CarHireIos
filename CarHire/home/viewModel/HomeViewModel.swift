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
    var showLoading = BehaviorRelay<Bool>(value: true)
    
    init() {
        self.homeRepository = HomeRepository()
    }
    
    func fetchHomeData() {
        homeRepository.homeSubject.subscribe(onNext: { [weak self] response in
            self?.homeSubject.onNext(response)
            self?.showLoading.accept(false)
        })
        homeRepository.fetchHomeData()
    }
}
