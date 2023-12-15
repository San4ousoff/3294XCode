//
//  CollectionViewController.swift
//  CW5
//
//  Created by Mac on 13.12.2023.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        // Configure the cell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // ячейка квадратная и занимает половину ширины коллекции
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.width / 2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

