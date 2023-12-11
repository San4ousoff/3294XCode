//
//  GroupsStruct.swift
//  HW4
//
//  Created by Mac on 10.12.2023.
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

