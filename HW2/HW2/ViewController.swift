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
        view.backgroundColor = .white

        // Создаем кнопку "Enter"
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)

        view.addSubview(button)
        setupConstrants()
        
        func setupConstrants(){
        // Определяем констрейнты для центрирования кнопки на экране
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }

    @objc func enterButtonTapped() {
        let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}


