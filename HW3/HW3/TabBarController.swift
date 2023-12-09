//
//  TabBarController.swift
//  HW3
//
//  Created by Mac on 07.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    var token: String

    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsViewController = FriendsViewController(token: token)
        friendsViewController.title = "Friends"
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.circle"), tag: 0)
        
//        // создаем экземпляр FriendsRequestManager
//        let friendsRequestManager = FriendsRequestManager.shared
//        // устанавливаем токен для FriendsRequestManager
//        friendsRequestManager.token = token
//        // загружаем и форматируем список друзей из FriendsRequestManager
//        friendsRequestManager.fetchFriends { result in
//            switch result {
//            case .success(let friends):
//                // Обработка успешного получения списка друзей
//                let formattedFriendsInfo = friends.map { "ID: \($0.id), Имя: \($0.firstName), Фамилия: \($0.lastName)" }
//                        let formattedString = formattedFriendsInfo.joined(separator: "\n")
//                        print("Отформатированный список друзей:\n\(formattedString)")
//            case .failure(let error):
//                // Обработка ошибки загрузки
//                print("Ошибка загрузки списка друзей: \(error)")
//            }
//        }
        
        let groupsViewController = GroupsViewController(token: token)
        groupsViewController.title = "Groups"
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)
        
        let photosViewController = PhotosViewController(token: token)
        photosViewController.title = "Photos"
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo.circle"), tag: 2)

        viewControllers = [friendsViewController, groupsViewController, photosViewController]
    }
}
