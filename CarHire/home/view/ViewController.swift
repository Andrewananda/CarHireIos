//
//  ViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 17/05/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private let viewModel = HomeViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        observeForLiveData()
    }

    private func observeForLiveData() {
        viewModel.homeLiveData.subscribe(onNext: {[weak self] response in
            print("Response \(response)")
            self?.displayTopData(car: response.featured_car)
        }).disposed(by: bag)
        viewModel.fetchHomeData()
    }

    private func displayTopData(car: [FeaturedCar]?) {
        if let cars = car {
            for item in cars {
                print("Car \(item)")
            }
        }
    }
}

