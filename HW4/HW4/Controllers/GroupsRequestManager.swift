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
