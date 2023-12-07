//
//  PhotoCell.swift
//  HW3
//
//  Created by Mac on 07.12.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    let imageView = UIImageView()
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 40)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(imageView)

        label.frame = CGRect(x: 5, y: contentView.frame.size.height - 35, width: contentView.frame.size.width - 10, height: 30)
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

