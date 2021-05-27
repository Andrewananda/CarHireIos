//
//  ViewController.swift
//  CarHire
//
//  Created by Andrew Ananda on 17/05/2021.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchHomeData()
    }


}

