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
    var ownerID: String?
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
        //collectionView.backgroundColor = .white
        collectionView.register(FriendInfoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        fetchFriendInfo()
        setupProfileSettingsButton()
    }

    /// Загрузка информации о друге
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
                print("Ошибка получения данных друга: \(error)")
                }
            }
        }
    }
    
    func setupProfileSettingsButton() {
        if friendID == ownerID {
            let settingsButton = UIBarButtonItem(title: "Настройки", style: .plain, target: self, action: #selector(profileSettingsButtonTapped))
            navigationItem.rightBarButtonItem = settingsButton
        }
    }
    
    @objc private func profileSettingsButtonTapped() {
        let settingsViewController = SettingsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        settingsViewController.ownerID = ownerID  // Передача ownerID в SettingsViewController
        navigationController?.pushViewController(settingsViewController, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // одна ячейка для отображения информации о друге
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
        return cell
    }
}
