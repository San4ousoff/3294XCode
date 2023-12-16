//
//  PhotoProfileByIDRequestManager.swift
//  HW4
//
//  Created by Mac on 15.12.2023.
//

import Foundation

class PhotoProfileByIDRequestManager {
    static let shared = PhotoProfileByIDRequestManager()
    
    func fetchPhotoProfile(forID friendID: String, withToken token: String, completion: @escaping (Result<PhotosResponse, Error>) -> Void) {
        let urlString = "https://api.vk.com/method/photos.get?owner_id=\(friendID)&album_id=profile&access_token=\(token)&v=5.131"
        
        if let url = URL(string: urlString) {
                    // Выводим информацию о запросе в консоль
                    print("Выполняется запрос: \(url)")
                    
                    DataFetcher.fetchData(from: url, responseType: PhotosResponse.self) { result in
                        // Выводим информацию о полученных данных в консоль
                        switch result {
                        case .success(let response):
                            print("Успешно получен ответ: \(response)")
                        case .failure(let error):
                            print("Произошла ошибка: \(error)")
                        }
                        // Передаем результат через замыкание
                        completion(result)
                    }
                }
    }
}
