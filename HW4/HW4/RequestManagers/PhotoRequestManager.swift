//
//  PhotoRequestManager.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import Foundation

class PhotoRequestManager: TokenManager {
    static let shared = PhotoRequestManager()
    var token: String?

    func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        do {
            let token = try validateToken()
            let urlString = "https://api.vk.com/method/photos.get?album_id=profile&access_token=\(token)&v=5.131"
            if let url = URL(string: urlString) {
                DataFetcher.fetchData(from: url, responseType: PhotosResponse.self) { (result: Result<PhotosResponse, Error>) in
                    switch result {
                    case .success(let photosResponse):
                        completion(.success(photosResponse.response.items))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}

//import Foundation
//
//struct Photo: Codable {
//    let sizes: [PhotoSize]
//    let text: String
//}
//
//struct PhotoSize: Codable {
//    let height: Int
//    let type: String
//    let width: Int
//    let url: String
//}
//
//struct PhotosResponse: Codable {
//    let response: PhotosResponseData
//}
//
//struct PhotosResponseData: Codable {
//    let count: Int
//    let items: [Photo]
//}
//
//class PhotoRequestManager: TokenManager {
//    static let shared = PhotoRequestManager()
//    var token: String?
//
//    func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
//        do {
//            let token = try validateToken()
//            let urlString = "https://api.vk.com/method/photos.get?album_id=profile&access_token=\(token)&v=5.131"
//
//            if let url = URL(string: urlString) {
//                let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                    if let error = error {
//                        completion(.failure(error))
//                    } else if let data = data {
//                        //if let dataString = String(data: data, encoding: .utf8) {
//                        //print(dataString)  // вывод полученной JSON строки для проверки
//                        //}
//                        do {
//                            let decoder = JSONDecoder()
//                            let photosResponse = try decoder.decode(PhotosResponse.self, from: data)
//                            let photos = photosResponse.response.items
//                            completion(.success(photos))
//                        } catch {
//                            completion(.failure(error))
//                        }
//                    }
//                }
//                task.resume()
//            }
//        } catch {
//            completion(.failure(error))
//        }
//    }
//}

