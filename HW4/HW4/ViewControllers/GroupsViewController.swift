//
//  GroupsViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class GroupsViewController: UIViewController, UITableViewDelegate {

    let tableView = UITableView()
    var token: String?
        
        init(token: String) {
            self.token = token
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        setupConstraints()
        navigationItem.title = "Groups"
        
        let groupsRequestManager = GroupsRequestManager.shared
        groupsRequestManager.token = token
        groupsRequestManager.fetchGroups { result in
        switch result {
            case .success(let groups):
                let formattedGroupsInfo = groups.map { "ID: \($0.id), Имя: \($0.name)"}
                let formattedString = formattedGroupsInfo.joined(separator: "\n")
                print("Отформатированный список групп:\n\(formattedString)")
            case .failure(let error):
                print("Ошибка загрузки списка групп: \(error)")
        }
    }
    
        func setupConstraints() {
            view.addSubview(tableView)
            NSLayoutConstraint.activate(ConstraintFactory.pinToEdges(of: view, withSubview: tableView))
        }
    }
}

extension GroupsViewController: UITableViewDataSource {
    // функция определяет количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    // функция определяет заполнение  ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Name Description"
        cell.imageView?.image = UIImage(systemName: "person.3")
        return cell
    }
   
}
