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
        viewModel.homeLiveData.subscribe({[weak self] response in
            debugPrint("Response \(response)")
        }).disposed(by: bag)
        viewModel.fetchHomeData()
    }

}

