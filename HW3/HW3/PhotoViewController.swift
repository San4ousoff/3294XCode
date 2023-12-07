//
//  PhotoViewController.swift
//  HW3
//
//  Created by Mac on 07.12.2023.
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
        setupConstraints()
        navigationItem.title = "Photos" 
    }

    func setupConstraints() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(ConstraintFactory.pinToEdges(of: view, withSubview: collectionView))
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
