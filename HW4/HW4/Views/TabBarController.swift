//
//  TabBarController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    var token: String
    var userID: String

    init(token: String, userID: String) {
        self.token = token
        self.userID = userID
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsViewController = UINavigationController(rootViewController: FriendsViewController(token: token, userID: userID))
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.circle"), tag: 0)
        
        let groupsViewController = UINavigationController(rootViewController: GroupsViewController(token: token))
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)
        
        let photoViewController = UINavigationController(rootViewController: PhotoViewController(token: token))
        photoViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo.circle"), tag: 2)

        viewControllers = [friendsViewController, groupsViewController, photoViewController]
//        viewControllers = [groupsViewController, photoViewController]

        
    }
}
