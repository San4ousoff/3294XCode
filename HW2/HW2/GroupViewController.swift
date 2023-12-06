//
//  GroupViewController.swift
//  HW2
//
//  Created by Mac on 05.12.2023.
//

import UIKit

class GroupsViewController: UIViewController {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        navigationItem.title = "Groups"
    }
    
}

extension GroupsViewController: UITableViewDelegate {
    
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
