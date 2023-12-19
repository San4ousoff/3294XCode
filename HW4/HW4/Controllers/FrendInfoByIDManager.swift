//
//  FrendInfoByIDManager.swift
//  HW4
//
//  Created by Mac on 18.12.2023.
//

import Foundation

class FriendInfoByIDManager: TokenManager {
    static let shared = FriendInfoByIDManager()
    var token: String?
    
    func fetchFriendInfo(userID: String, completion: @escaping (Result<FriendInfoResponse, Error>) -> Void) {
        do {
            let token = try validateToken()
            let urlString = "https://api.vk.com/method/users.get?user_ids=\(userID)&fields=first_name,last_name&access_token=\(token)&v=5.131"
            if let url = URL(string: urlString) {
                DataFetcher.fetchData(from: url, responseType: FriendInfoResponse.self) { (result: Result<FriendInfoResponse, Error>) in
                    switch result {
                        case .success(let friendInfoResponse):
                            completion(.success(friendInfoResponse))
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

