//
//  TableViewController.swift
//  CW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class TableViewController: UITableViewController {

    private var towns: [Town] = []
    private let networkService = NetworkService()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        networkService.getData{ [weak self] towns in
            self?.towns = towns
            DispatchQueue.main.async { // обращаемся к основной очереди асинхронно
                self?.tableView.reloadData()
            }
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        guard let cell = cell as? CustomTableViewCell else { return UITableViewCell() }
        let town = towns[indexPath.row]
        cell.setup(nameTown: town.nameTown, lat: town.coords.lat, lon: town.coords.lon)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        towns.count
    }
    
}
