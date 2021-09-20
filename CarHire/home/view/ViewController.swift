//
//  ViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 17/05/2021.
//

import UIKit
import RxSwift
import RxRelay

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topDealsCollectionView: UICollectionView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    private let viewModel = HomeViewModel()
    private let bag = DisposeBag()
    
    private var featuredCar = BehaviorRelay<FeaturedCar?>(value: nil)
    private var topDealData = BehaviorRelay<FeaturedCar?>(value: nil)
    private var topDealsCount: [FeaturedCar] = []
    
    private var carDetails: FeaturedCar?
    private var testText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        observeForLiveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func showLoading() {
        viewModel.showLoading.subscribe(onNext: {[weak self] value in
            if(value) {
                self?.scrollView.isHidden = true
                self?.loader.startAnimating()
            } else {
                
                self?.loader.stopAnimating()
                self?.loader.hidesWhenStopped = true
                self?.scrollView.isHidden = false
            }
        }).disposed(by: bag)
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
        if let topDeals = topDeals{
            for topDeal in topDeals {
                topDealData.accept(topDeal)
                topDealsCount.append(topDeal)
            }
        }
        DispatchQueue.main.async {
            self.topDealsCollectionView.reloadData()
        }
    }
    
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topDealsCollectionView {
            return topDealsCount.count
        }else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topDealsCollectionView {
            let cell = topDealsCollectionView.dequeueReusableCell(withReuseIdentifier: K.viewConstants.topDealsCell, for: indexPath) as! TopViewDataCell
            cell.title.text = topDealsCount[indexPath.row].model?.title
            cell.duration.text = topDealsCount[indexPath.row].hire_duration?.name
            cell.loadImage(url: topDealsCount[indexPath.row].photo)
            cell.amount.text = "Kes \(numberFormatter(number: topDealsCount[indexPath.row].price))"
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.viewConstants.reusableFeaturedCarCell, for: indexPath) as! FeaturedCarViewCell
            featuredCar.subscribe(onNext: {response in
                cell.carName.text = response?.model?.title
                cell.plateNumber.text = response?.number_plate
                guard let imageUrl = response?.photo else {
                    return
                }
                guard let amount = response?.price else {
                    return
                }
                cell.amount.text = "Kes \(numberFormatter(number: amount))"
                cell.loadImage(url: imageUrl)
            }).disposed(by: bag)

            return cell
        }

    }
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        carDetails = topDealsCount[indexPath.row]
        if collectionView == topDealsCollectionView {
            self.performSegue(withIdentifier: K.viewConstants.carDetailSegue, sender: self)
        }else {
            print("selected featuredCar \(topDealsCount[indexPath.row])")
            self.performSegue(withIdentifier: K.viewConstants.carDetailSegue, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.viewConstants.carDetailSegue {
            let vc = segue.destination as! CarDetailController
            vc.carDetail = carDetails
        }
    }
}
