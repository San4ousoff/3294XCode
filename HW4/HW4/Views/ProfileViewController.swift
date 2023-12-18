//
//  ProfileViewController.swift
//  HW4
//
//  Created by Mac on 15.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Профиль"
    }

    var personImageView: UIImageView?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if personImageView != nil {
            personImageView?.removeFromSuperview()
            personImageView = nil
        }

        personImageView = UIImageView(image: UIImage(systemName: "person"))
        personImageView?.tintColor = .systemBlue
        let imageSize: CGFloat = 200
        let finalSize: CGFloat = 50
        personImageView?.frame = CGRect(x: (view.frame.width - imageSize) / 2, y: (view.frame.height - imageSize) / 2, width: imageSize, height: imageSize)
        personImageView?.alpha = 0  // Устанавливаем нулевую прозрачность перед началом анимации
        if let personView = personImageView {
            view.addSubview(personView)
            UIView.animate(withDuration: 0.5, animations: {
                personView.frame = CGRect(x: (self.view.frame.width - finalSize) / 2, y: (self.view.frame.height - finalSize) / 3, width: finalSize, height: finalSize)
                personView.alpha = 1  // Изменяем прозрачность на полную непрозрачность
            })
        }
    }
}


