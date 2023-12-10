//
//  GroupsRequestManager.swift
//  HW3
//
//  Created by Mac on 08.12.2023.
//

import Foundation

struct Group: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
   }
}

struct GroupsResponse: Codable {
    let response: GroupResponseData
}

struct GroupResponseData: Codable {
    let count: Int
    let items: [Group]
}

class GroupsRequestManager: TokenManager {
    static let shared = GroupsRequestManager()
    var token: String?

    func fetchFriends(completion: @escaping (Result<[Group], Error>) -> Void) {
        do {
            let token = try validateToken()
            let urlString = "https://api.vk.com/method/groups.get?extended=1&access_token=\(token)&v=5.131"
            
            if let url = URL(string: urlString) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        completion(.failure(error))
                    } else if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let groupsResponse = try decoder.decode(GroupsResponse.self, from: data)
                            let groups = groupsResponse.response.items
                            completion(.success(groups))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                }
                task.resume()
            }
        } catch {
            completion(.failure(error))
        }
    }
}
