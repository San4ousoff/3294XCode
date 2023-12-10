//
//  PhotoViewController.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CardCollectionViewFlowLayout())
    var token: String?
    var photos: [Photo] = []
    
    init(token: String) {
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let customLayout = CardCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: customLayout)
            
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        collectionView.backgroundColor = .white
            
        view.addSubview(collectionView)
        setupConstraints()
        navigationItem.title = "Photos"

        let photoRequestManager = PhotoRequestManager.shared
        photoRequestManager.token = token
        photoRequestManager.fetchPhotos { result in
            switch result {
            case .success(let photos):
                let formattedPhotosInfo: [String] = photos.map { photo in
                    let urls = photo.sizes.map { $0.url }
                    return "URLs: \(urls.joined(separator: ", "))" // объединяем URL через запятую
                }
                let formattedString = formattedPhotosInfo.joined(separator: "\n")
                print("Список URL фото:\n\(formattedString)")
            case .failure(let error):
                print("Ошибка загрузки списка фотографий: \(error)")
            }
        }

        func setupConstraints() {
            view.addSubview(collectionView)
            NSLayoutConstraint.activate(ConstraintFactory.pinToEdges(of: view, withSubview: collectionView))
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Замените 10 на количество карточек, которые вы хотите отобразить
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.imageView.image = UIImage(systemName: "photo") // Замените "placeholder_image" на ваше изображение
        cell.label.text = "Photo" // Замените на текст, который вы хотите отобразить
        return cell
    }
}

