//
//  CarDetail.swift
//  CarHire
//
//  Created by Andrew Ananda on 24/06/2021.
//

import UIKit

class CarDetailController: UIViewController {

    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var hiringPrice: UILabel!
    @IBOutlet weak var carDescription: UILabel!
    
    var carDetail: FeaturedCar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCarDetails()
        setCarDetails(with: carDetail)
    }
    
    let urls: [URL] = [
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png")!,
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png")!,
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/3.png")!
    ]
    
    private func setUpCarDetails() {
        carDescription.text = "Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It's not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real. As Cicero would put it, “Um, not so fast.The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin."
    }
    
    func setCarDetails(with data: FeaturedCar?) {
        if let carDetail = data {
            carName.text = carDetail.model?.title
            hiringPrice.text = numberFormatter(number: carDetail.price)
        }else {
            print("No data found!")
        }
    }
    
//    lazy var carousel = Carousel(frame: .zero, urls: urls)
//
//    override func loadView() {
//        let view = imageCollectionView
//        self.view = view
//    }
//
//    func setupHierarchy() {
//        self.view.addSubview(carousel)
//    }
//
//    func setupComponents() {
//        carousel.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            carousel.topAnchor.constraint(equalTo: view.topAnchor),
//            carousel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            carousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            carousel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }

}
