//
//  ProfileViewController.swift
//  HW4
//
//  Created by Mac on 15.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Профиль"
    }
    
    @objc private func goToFriendsButtonTapped() {
        if let tabBarController = tabBarController as? TabBarController {
            tabBarController.selectedIndex = 0 // Переключение на вкладку "Друзья"
        }
    }
}
