//
//  CardCollectionViewFlowLayout.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class CardCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = 20
        itemSize = CGSize(width: 150, height: 200)
    }
}
