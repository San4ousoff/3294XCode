//
//  ThemeCell.swift
//  HW4
//
//  Created by Mac on 21.12.2023.
//

import UIKit

class ThemeCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        // настройка расположения titleLabel или других представлений в вашей ячейке
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure(with theme: AppTheme) {
        contentView.backgroundColor = theme.backgroundColor
        titleLabel.textColor = theme.textColor
        // другие настройки в соответствии с выбранной темой
    }
}
