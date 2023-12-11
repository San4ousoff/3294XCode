//
//  PhotoViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class PhotoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

// блок переменных и инициализаторов
    var token: String?
    var photos: [Photo] = []

    init(token: String) {
        self.token = token
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// блок переопределенных методов из родительского класса
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        navigationItem.title = "Фотографии" // Установить заголовок через navigationItem.title

        fetchPhotos()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let photo = photos[indexPath.item]
        // вызов метода для загрузки фотографии
        loadPhoto(from: photo.sizes[0].url) { image in
            DispatchQueue.main.async {
                cell.imageView.image = image // обновление изображение в ячейке
            }
        }
        cell.label.text = "Фото"
        return cell
    }
    
// блок кастомных методов
    
    // метод форматирования ответа на запрос, полученного с помощью PhotoRequestManager
    func fetchPhotos() {
        let photoRequestManager = PhotoRequestManager.shared
        photoRequestManager.token = token
        photoRequestManager.fetchPhotos { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let fetchedPhotos):
                self.photos = fetchedPhotos
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Ошибка загрузки списка фотографий: \(error)")
            }
        }
    }

    // метод настройки размеров ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // ячейка квадратная и занимает половину ширины коллекции
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.width / 2)
    }
    
    // метод загрузки фото из URL-адреса
    func loadPhoto(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Ошибка при загрузке изображения: \(error.localizedDescription)")
                completion(nil)
                return
            }

            if let data = data, let image = UIImage(data: data) {
                completion(image) // Возвращаем загруженное изображение
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
