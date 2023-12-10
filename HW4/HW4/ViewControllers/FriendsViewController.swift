//
//  FriendsViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class FriendsViewController: UIViewController {
    let tableView = UITableView()
    var token: String?
    var friends: [Friend] = []

    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchFriends()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate(ConstraintFactory.pinToEdges(of: view, withSubview: tableView))
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Friends"
    }

    func fetchFriends() {
        let friendsRequestManager = FriendsRequestManager.shared
        friendsRequestManager.token = token
        friendsRequestManager.fetchFriends { result in
            switch result {
                case .success(let fetchedFriends):
                self.friends = fetchedFriends.sorted { ($0.isOnline != 0) && ($1.isOnline == 0) } // сортируем
                    DispatchQueue.main.async {
                        //self.navigationItem.title = "Friends (\(self.friends.count))"
                        self.updateFriendList()
                    }
                case .failure(let error):
                    print("Ошибка загрузки списка друзей: \(error)")
            }
        }
    }

    func updateFriendList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        cell.imageView?.image = UIImage(systemName: "person") // сюда надо потом фото подтянуть

        if (friend.isOnline != 0) {
            cell.textLabel?.textColor = .green  // онлайн, устанавливаем зеленый цвет шрифта
        } else {
            cell.textLabel?.textColor = .red  // не в сети, устанавливаем красный цвет шрифта
        }

        return cell
    }
}

extension FriendsViewController: UITableViewDelegate {

}
