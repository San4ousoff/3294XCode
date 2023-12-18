//
//  FriendsRequestManager.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import Foundation

class FriendsRequestManager: TokenManager {
    static let shared = FriendsRequestManager()
    var token: String?
    
    func fetchFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        do {
            let token = try validateToken()
            let urlString = "https://api.vk.com/method/friends.get?fields=first_name,last_name,online&access_token=\(token)&v=5.131"
            if let url = URL(string: urlString) {
                DataFetcher.fetchData(from: url, responseType: FriendsResponse.self) { (result: Result<FriendsResponse, Error>) in
                    switch result {
                    case .success(let friendsResponse):
                        completion(.success(friendsResponse.response.items))
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
