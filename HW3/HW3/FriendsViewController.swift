//
//  FriendsViewController.swift
//  HW3
//
//  Created by Mac on 07.12.2023.
//

import UIKit

class FriendsViewController: UIViewController {

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
        navigationItem.title = "Friends"
    }
    
    func setupConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate(ConstraintFactory.pinToEdges(of: view, withSubview: tableView))
    }

}

extension FriendsViewController: UITableViewDelegate {
    
}

extension FriendsViewController: UITableViewDataSource {
    // функция определяет количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    // функция определяет заполнение  ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Name"
        cell.imageView?.image = UIImage(systemName: "person")
        return cell
    }
}
