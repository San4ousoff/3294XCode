//
//  ViewController.swift
//  CW3
//
//  Created by Mac on 06.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkService = NetworkService()
        networkService.getData()
    }


}

