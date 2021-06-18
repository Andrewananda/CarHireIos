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
            self?.displayTopDeals(topDeals: response.top_deals)
            self?.displayTopData(car: response.featured_car)
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
        //print("TopDeals \(topDeals)")
        if let topDeals = topDeals{
            for topDeal in topDeals {
                topDealData.accept(topDeal)
            }
        }
    }
    
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topDealsCollectionView {
            return 100
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topDealsCollectionView {
            let cell = topDealsCollectionView.dequeueReusableCell(withReuseIdentifier: K.viewConstants.topDealsCell, for: indexPath) as! TopViewDataCell
            topDealData.subscribe(onNext: {response in
                cell.title.text = response?.model?.title
                cell.duration.text = response?.hire_duration?.name
                
                guard let imageUrl = response?.photo else {
                    return
                }
                cell.loadImage(url: imageUrl)
            }).disposed(by: bag)
            
            return cell
        }else {
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
    }
}
