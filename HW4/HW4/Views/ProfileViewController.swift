//
//  ProfileViewController.swift
//  HW4
//
//  Created by Mac on 15.12.2023.
//

import UIKit

class ProfileViewController: UICollectionViewController {

    var friendID: String?
    var token: String?
    var friendInfo: FriendInfo? // Переменная для хранения информации о друге
    let reuseIdentifier = "Cell"

    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(FriendInfoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        fetchFriendInfo()
    }

        // Загрузка информации о друге
        func fetchFriendInfo() {
            if let friendID = friendID, let token = token {
                FriendInfoByIDManager.shared.token = token
                FriendInfoByIDManager.shared.fetchFriendInfo(userID: friendID) { result in
                switch result {
                case .success(let friendInfoResponse):
                    if let friend = friendInfoResponse.response.first {
                        self.friendInfo = friend
                        // Вывод полученных данных в консоль
                        print("Информация о друге: \(friend)")
                        DispatchQueue.main.async {
                            self.collectionView.reloadData() // Перезагрузка данных коллекции после получения информации о друге
                        }
                    } else {
                        // Обработка ситуации, если данные друга не были получены
                    }
                case .failure(let error):
                    // Обработка ошибки при получении данных друга
                    print("Ошибка получения данных друга: \(error)")
                }
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // У нас будет одна ячейка для отображения информации о друге
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        if let friend = friendInfo {
            if let friendCell = cell as? FriendInfoCell {
                friendCell.nameLabel.text = "Имя: \(friend.firstName)"
                friendCell.lastNameLabel.text = "Фамилия: \(friend.lastName)"
                return friendCell
            }
        }

        // Обработка ситуации, если данные друга недоступны или не удалось создать кастомную ячейку
        return cell
    }
}

//    var personImageView: UIImageView?

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        if personImageView != nil {
//            personImageView?.removeFromSuperview()
//            personImageView = nil
//        }

//        personImageView = UIImageView(image: UIImage(systemName: "person"))
//        personImageView?.tintColor = .systemBlue
//        let imageSize: CGFloat = 200
//        let finalSize: CGFloat = 50
//        personImageView?.frame = CGRect(x: (view.frame.width - imageSize) / 2, y: (view.frame.height - imageSize) / 2, width: imageSize, height: imageSize)
//        personImageView?.alpha = 0  // Устанавливаем нулевую прозрачность перед началом анимации
//        if let personView = personImageView {
//            view.addSubview(personView)
//            UIView.animate(withDuration: 0.5, animations: {
//                personView.frame = CGRect(x: (self.view.frame.width - finalSize) / 2, y: (self.view.frame.height - finalSize) / 3, width: finalSize, height: finalSize)
//                personView.alpha = 1  // Изменяем прозрачность на полную непрозрачность
//            })
//        }
//    }





