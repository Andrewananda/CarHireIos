//
//  CarDetail.swift
//  CarHire
//
//  Created by Andrew Ananda on 24/06/2021.
//

import UIKit

class CarDetail: UIViewController {

    var labelText: String?
    @IBOutlet weak var imageCollectionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupHierarchy()
//        setupComponents()
//        setupConstraints()
    }
    
    let urls: [URL] = [
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png")!,
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png")!,
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/3.png")!
    ]
    
    lazy var carousel = Carousel(frame: .zero, urls: urls)
    
    override func loadView() {
        let view = imageCollectionView
        self.view = view
    }
    
    func setupHierarchy() {
        self.view.addSubview(carousel)
    }
    
    func setupComponents() {
        carousel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(equalTo: view.topAnchor),
            carousel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            carousel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carousel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
