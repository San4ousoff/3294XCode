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
