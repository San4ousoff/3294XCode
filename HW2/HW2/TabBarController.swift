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
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "person"), tag: 0)

        let groupsViewController = GroupsViewController()
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "group"), tag: 1)

        let photosViewController = PhotosViewController()
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(named: "photos"), tag: 2)

        self.viewControllers = [friendsViewController, groupsViewController, photosViewController]
    }
}
