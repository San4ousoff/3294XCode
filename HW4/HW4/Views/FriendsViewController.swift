//
//  FriendsViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit
import CoreData

class FriendsViewController: UITableViewController {
    var token: String
    var userID: String
    var friends: [Friend] = []
    let friendIDProvider = FriendIDProvider()

    init(token: String, userID: String) {
        self.token = token
        self.userID = userID
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Друзья"
        setupProfileBar()
        fetchFriendsFromCoreData() // Добавлен вызов загрузки друзей из Core Data
        fetchFriendsFromAPI() // Добавлен вызов загрузки друзей из API
        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        cell.imageView?.image = UIImage(systemName: "person")

        if friend.isOnline != 0 {
            cell.textLabel?.textColor = .green
        } else {
            cell.textLabel?.textColor = .red
        }
        return cell
    }

    private func fetchFriendsFromAPI() {
        let friendsRequestManager = FriendsRequestManager.shared
        friendsRequestManager.token = token

        friendsRequestManager.fetchFriends { result in
            switch result {
            case .success(let fetchedFriends):
                self.saveFriendsToCoreData(fetchedFriends)

                // вывод в консоль о количестве полученных записей для проверки
//                let totalFriendsCount = fetchedFriends.count
//                let onlineFriendsCount = fetchedFriends.filter { $0.isOnline != 0 }.count
//                print("Всего друзей от API: \(totalFriendsCount), Online: \(onlineFriendsCount)")

            case .failure(let error):
                print("Ошибка загрузки списка друзей от API: \(error)")
            }
        }
    }

    private func saveFriendsToCoreData(_ friends: [Friend]) {
        let coreDataStack = CoreDataStack.shared
        let context = coreDataStack.context

        context.perform {
            do {
                let currentDate = Date() // Текущая дата и время
                // Удаляем существующие записи
                let fetchRequest: NSFetchRequest<FriendsEntity> = FriendsEntity.fetchRequest()
                let existingFriends = try context.fetch(fetchRequest)
                for friend in existingFriends {
                    context.delete(friend)
                }

                // Добавляем новые записи из API
                for friend in friends {
                    let newFriend = FriendsEntity(context: context)
                    newFriend.id = Int32(friend.id)
                    newFriend.firstName = friend.firstName
                    newFriend.lastName = friend.lastName
                    newFriend.isOnline = Int32(friend.isOnline)
                    newFriend.timestamp = currentDate // Сохраняем текущую дату и время в поле timestamp
                }

                coreDataStack.saveContext()
                print("Информация о дате и времени на момент загрузки данных из API в Core Data:")
                self.fetchLastUpdateDateFromCoreData() // Получение даты последнего обновления из Core Data
            } catch {
                print("Ошибка при сохранении данных в Core Data: \(error)")
            }
        }
    }
    
    private func fetchFriendsFromCoreData() {
        let coreDataStack = CoreDataStack.shared
        let context = coreDataStack.context

        context.perform {
            do {
                // Получаем время из Core Data перед получением самих данных
                print("Информация о дате и времени на момент загрузки данных из Core Data:")
                self.fetchLastUpdateDateFromCoreData()
                
                let fetchRequest: NSFetchRequest<FriendsEntity> = FriendsEntity.fetchRequest()
                fetchRequest.sortDescriptors = [NSSortDescriptor(key: "isOnline", ascending: false)] // Сортировка по статусу онлайн
                
                let fetchedFriends = try context.fetch(fetchRequest)

                var friendsData: [Friend] = []
                for friend in fetchedFriends {
                    friendsData.append(Friend(id: Int(friend.id), firstName: friend.firstName ?? "", lastName: friend.lastName ?? "", isOnline: Int(friend.isOnline)))
                }
                
                // вывод в консоль о количестве полученных записей для проверки
//                let totalFriendsCount = fetchedFriends.count
//                let onlineFriendsCount = fetchedFriends.filter { $0.isOnline != 0 }.count
//                print("Всего друзей из Core Data: \(totalFriendsCount), Online: \(onlineFriendsCount)")

    //            for friend in fetchedFriends {
    //                print("Friend: \(friend.firstName) \(friend.lastName), isOnline: \(friend.isOnline == 1 ? "Online" : "Offline")")
    //            }
                
                DispatchQueue.main.async {
                    self.friends = friendsData
                    self.tableView.reloadData()
                }

            } catch {
                print("Ошибка при извлечении данных из Core Data: \(error)")
            }
        }
    }
    
    private func fetchLastUpdateDateFromCoreData() {
        let coreDataStack = CoreDataStack.shared
        let context = coreDataStack.context

        context.perform {
            let fetchRequest: NSFetchRequest<FriendsEntity> = FriendsEntity.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)] // Сортировка по полю timestamp для получения самого последнего изменения

            do {
                let lastUpdate = try context.fetch(fetchRequest).first?.timestamp
                if let lastUpdate = lastUpdate {
                    // Создаем DateFormatter
                    let dateFormatter = DateFormatter()
                    // Устанавливаем формат даты и времени
                    dateFormatter.dateStyle = .medium
                    dateFormatter.timeStyle = .medium
                    // Подставляем часовой пояс устройства
                    dateFormatter.timeZone = TimeZone.current
                    // Выводим время с использованием настроенного DateFormatter
                    print("Последнее обновление в Core Data: \(dateFormatter.string(from: lastUpdate))")
                } else {
                    print("Core Data пустая")
                }
            } catch {
                print("Ошибка при извлечении даты последнего обновления из Core Data: \(error)")
            }
        }
    }



    // кнопка Профиль в навигации
    private func setupProfileBar() {
        let profileButton = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    // при нажатии на кнопку Профиль, переходим в профиль владельца приложения, тк передаем его ID во вью Профиля
    @objc private func profileButtonTapped() {
        let profileViewController = ProfileViewController()
        // Получаем сохраненный ownerID из UserDefaults
        if let ownerID = UserDefaults.standard.string(forKey: "ownerID_\(userID)") {
            print("OwnerID:\(ownerID)")
            profileViewController.ownerID = ownerID // Передаем ownerID в ownerID ProfileViewController
            profileViewController.friendID = ownerID // Передаем ownerID в friendID ProfileViewController
        }
        profileViewController.token = token  // Передаем токен в ProfileViewController
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    // при нажатии на ячейку друга, переходим в профиль друга, тк передаем его ID во вью Профиля
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFriend = friends[indexPath.row]
        let friendID = friendIDProvider.getFriendID(from: selectedFriend)
        print("Выбран ID друга: \(friendID)")
        
        let profileViewController = ProfileViewController()
        profileViewController.friendID = friendID  // Передаем friendID в ProfileViewController
        profileViewController.token = token  // Передаем токен в ProfileViewController
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

