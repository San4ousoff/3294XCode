//
//  FriendsViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    var token: String?
    var friends: [Friend] = []

    init(token: String) {
        self.token = token
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Друзья"
        fetchFriends()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        cell.imageView?.image = UIImage(systemName: "person")

        if friend.isOnline != 0 {
            cell.textLabel?.textColor = .green
        } else {
            cell.textLabel?.textColor = .red
        }
        return cell
    }

    func fetchFriends() {
        let friendsRequestManager = FriendsRequestManager.shared
        friendsRequestManager.token = token
        friendsRequestManager.fetchFriends { result in
            switch result {
                case .success(let fetchedFriends):
                    self.friends = fetchedFriends.sorted { ($0.isOnline != 0) && ($1.isOnline == 0) } // сортировка
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Ошибка загрузки списка друзей: \(error)")
            }
        }
    }
}