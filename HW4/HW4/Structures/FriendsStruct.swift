//
//  FriendsStruct.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
//

import Foundation

struct Friend: Codable {
    let id: Int
    let firstName: String
    let lastName: String
//    let canAccessClosed: Bool
//    let isClosed: Bool
    let isOnline: Int

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
//        case canAccessClosed = "can_access_closed"
//        case isClosed = "is_closed"
        case isOnline = "online"
    }
}

struct FriendsResponse: Codable {
    let response: FriendsResponseData
}

struct FriendsResponseData: Codable {
    let count: Int
    let items: [Friend]
}