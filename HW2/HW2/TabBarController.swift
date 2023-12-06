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

        let friendsViewController = FriendsViewController()
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)

        let groupsViewController = GroupsViewController()
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)

        let photosViewController = PhotosViewController()
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)

        self.viewControllers = [friendsViewController, groupsViewController, photosViewController]
    }
}
