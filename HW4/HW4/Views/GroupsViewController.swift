//
//  GroupsViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class GroupsViewController: UITableViewController {
    var token: String?
    var groups: [Group] = []

    init(token: String) {
        self.token = token
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Группы"
        fetchGroups()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = groups[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        cell.textLabel?.text = "\(group.name)"
        cell.imageView?.image = UIImage(systemName: "person.3")

        return cell
    }

    func fetchGroups() {
        let groupsRequestManager = GroupsRequestManager.shared
        groupsRequestManager.token = token
        groupsRequestManager.fetchGroups { result in
            switch result {
            case .success(let groups):
                self.groups = groups
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Ошибка загрузки списка групп: \(error)")
            }
        }
    }
}

