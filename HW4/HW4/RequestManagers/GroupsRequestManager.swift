//
//  GroupsRequestManager.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import Foundation

class GroupsRequestManager: TokenManager {
    static let shared = GroupsRequestManager()
    var token: String?
    
    func fetchGroups(completion: @escaping (Result<[Group], Error>) -> Void) {
        do {
            let token = try validateToken()
            let urlString = "https://api.vk.com/method/groups.get?extended=1&access_token=\(token)&v=5.131"
            if let url = URL(string: urlString) {
                DataFetcher.fetchData(from: url, responseType: GroupsResponse.self) { (result: Result<GroupsResponse, Error>) in
                    switch result {
                    case .success(let groupsResponse):
                        completion(.success(groupsResponse.response.items))
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
//struct Group: Codable {
//    let id: Int
//    let name: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name = "name"
//   }
//}
//
//struct GroupsResponse: Codable {
//    let response: GroupResponseData
//}
//
//struct GroupResponseData: Codable {
//    let count: Int
//    let items: [Group]
//}
//
//class GroupsRequestManager: TokenManager {
//    static let shared = GroupsRequestManager()
//    var token: String?
//
//    func fetchFriends(completion: @escaping (Result<[Group], Error>) -> Void) {
//        do {
//            let token = try validateToken()
//            let urlString = "https://api.vk.com/method/groups.get?extended=1&access_token=\(token)&v=5.131"
//
//            if let url = URL(string: urlString) {
//                let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                    if let error = error {
//                        completion(.failure(error))
//                    } else if let data = data {
//                        do {
//                            let decoder = JSONDecoder()
//                            let groupsResponse = try decoder.decode(GroupsResponse.self, from: data)
//                            let groups = groupsResponse.response.items
//                            completion(.success(groups))
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
