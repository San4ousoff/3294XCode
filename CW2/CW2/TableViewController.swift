//
//  TableViewController.swift
//  CW2
//
//  Created by Mac on 05.12.2023.
//

import UIKit

class TableViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        title = "TableView"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarItem.title = "NewTableView"
        view.addSubview(tableView)
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

        ])
    }
    
    private func getLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(view.frame.size.width/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension TableViewController: UITableViewDataSource {
    // функция определяет количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    // функция определяет заполнение  ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Hello"
        cell.imageView?.image = UIImage(systemName: "person")
        return cell
    }
    // функция определяет количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    // функция определяет заголовок секции
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section"
    }
}

extension TableViewController: UITableViewDelegate {
    // функция определяющая действие при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(CollectionViewController(collectionViewLayout: getLayout()), animated: true)
    }
    // функция определяет высоту
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
}
