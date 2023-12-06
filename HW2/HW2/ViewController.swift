//
//  ViewController.swift
//  HW2
//
//  Created by Mac on 05.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Добавляем кнопку "Enter"
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(button)
    }

    @objc func enterButtonTapped() {
        let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}

