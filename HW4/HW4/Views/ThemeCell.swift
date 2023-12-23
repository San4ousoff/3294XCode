//
//  ThemeCell.swift
//  HW4
//
//  Created by Mac on 21.12.2023.
//

import UIKit

protocol ThemeCellDelegate: AnyObject {
    func didSelectTheme(_ theme: AppTheme)
}

class ThemeCell: UICollectionViewCell {

    weak var delegate: ThemeCellDelegate?

    let themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.borderWidth = 1
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(themeLabel)

        NSLayoutConstraint.activate([
            themeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            themeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            themeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            themeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure(with theme: AppTheme, delegate: ThemeCellDelegate) {
        backgroundColor = theme.backgroundColor
        themeLabel.text = theme == .standard ? "Светлая тема" : "Темная тема"
        themeLabel.textColor = theme.textColor
        
        if theme == .standard {
            themeLabel.layer.borderColor = UIColor.black.cgColor
        } else {
            themeLabel.layer.borderColor = UIColor.white.cgColor
        }
        
        self.delegate = delegate
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if let delegate = delegate {
            let selectedTheme = themeLabel.text == "Светлая тема" ? AppTheme.standard : AppTheme.dark
            delegate.didSelectTheme(selectedTheme)
        }
    }
}
