//
//  ConstraintFactory.swift
//  HW3
//
//  Created by Mac on 07.12.2023.
//

import UIKit

class ConstraintFactory {
    // констрейнты для центрирования
    static func center(in view: UIView, withSubview subview: UIView) -> [NSLayoutConstraint] {
        return [
            subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    // констрейнты для растягивания
    static func pinToEdges(of view: UIView, withSubview subview: UIView) -> [NSLayoutConstraint] {
        return [
            subview.topAnchor.constraint(equalTo: view.topAnchor),
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
    }
    
    // Другие методы для создания констрейнтов...
}
