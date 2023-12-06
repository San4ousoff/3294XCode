//
//  TabBarController.swift
//  HW2
//
//  Created by Mac on 05.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsViewController = UINavigationController(rootViewController: FriendsViewController())
        friendsViewController.title = "Friends"
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)

        let groupsViewController = UINavigationController(rootViewController: GroupsViewController())
        groupsViewController.title = "Groups"
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)

        let photosViewController = UINavigationController(rootViewController: PhotosViewController())
        photosViewController.title = "Photos"
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)

        viewControllers = [friendsViewController, groupsViewController, photosViewController]
    }
}

