//
//  ViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 17/05/2021.
//

import UIKit
import RxSwift
import RxRelay

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topDealsCollectionView: UICollectionView!
    private let viewModel = HomeViewModel()
    private let bag = DisposeBag()
    
    private var featuredCar = BehaviorRelay<FeaturedCar?>(value: nil)
    private var topDealData = BehaviorRelay<FeaturedCar?>(value: nil)
    private var topData = [FeaturedCar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        observeForLiveData()
        
    }
    

    private func observeForLiveData() {
        viewModel.homeLiveData.subscribe(onNext: {[weak self] response in
            print("Response \(response)")
            self?.displayTopData(car: response.featured_car)
            self?.displayTopDeals(topDeals: response.top_deals)
        }).disposed(by: bag)
        viewModel.fetchHomeData()
    }

    private func displayTopData(car: [FeaturedCar]?) {
        if let cars = car {
            for item in cars {
                featuredCar.accept(item)
            }
        }
    }
    
    private func displayTopDeals(topDeals: [FeaturedCar]?) {
        if let topDeals = topDeals{
            for topDeal in topDeals {
                topDealData.accept(topDeal)
            }
        }
    }
    
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 1
        }
        else {
            topDealData.subscribe(onNext: {[weak self] response in
                if let data = response{
                    self?.topData.append(data)
                }
            }).disposed(by: bag)
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.viewConstants.reusableFeaturedCarCell, for: indexPath) as! FeaturedCarViewCell
            featuredCar.subscribe(onNext: {response in
                cell.carName.text = response?.model?.title
                cell.plateNumber.text = response?.number_plate
                guard let imageUrl = response?.photo else {
                    return
                }
                cell.loadImage(url: imageUrl)
            }).disposed(by: bag)

            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.viewConstants.topDealsCell, for: indexPath) as! TopViewCell
            topDealData.subscribe(onNext: {response in

            }).disposed(by: bag)
            return cell
        }
    }
}
