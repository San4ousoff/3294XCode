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



//import Foundation
//
//struct Friend: Codable {
//    let id: Int
//    let firstName: String
//    let lastName: String
//    let canAccessClosed: Bool
//    let isClosed: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case canAccessClosed = "can_access_closed"
//        case isClosed = "is_closed"
//    }
//}
//
//struct FriendsResponse: Codable {
//    let response: FriendsResponseData
//}
//
//struct FriendsResponseData: Codable {
//    let count: Int
//    let items: [Friend]
//}
//
//class FriendsRequestManager: TokenManager {
//    static let shared = FriendsRequestManager()
//    var token: String?
//
//    func fetchFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
//        do {
//            let token = try validateToken()
//            let urlString = "https://api.vk.com/method/friends.get?fields=first_name,last_name&access_token=\(token)&v=5.131"
//
//            if let url = URL(string: urlString) {
//                let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                    if let error = error {
//                        completion(.failure(error))
//                    } else if let data = data {
//                        do {
//                            let decoder = JSONDecoder()
//                            let friendsResponse = try decoder.decode(FriendsResponse.self, from: data)
//                            let friends = friendsResponse.response.items
//                            completion(.success(friends))
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
