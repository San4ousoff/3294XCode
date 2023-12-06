//
//  PhotosViewController.swift
//  HW2
//
//  Created by Mac on 05.12.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CardCollectionViewFlowLayout())
    let data = [("Person1", "Alice"), ("Person2", "Bob"), ("Person3", "Charlie"), ("Person4", "David"), ("Person5", "Eve"), ("Person6", "Frank")]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        collectionView.backgroundColor = .white

        view.addSubview(collectionView)

        setupConstraints()  // Устанавливаем констрейнты
        navigationItem.title = "Photos"  // Установим название экрана в навигационном элементе
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.imageView.image = UIImage(named: data[indexPath.row].0)
        cell.label.text = data[indexPath.row].1
        return cell
    }
}
