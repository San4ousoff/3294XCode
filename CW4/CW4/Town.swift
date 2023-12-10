//
//  Town.swift
//  CW4
//
//  Created by Mac on 10.12.2023.
//

import Foundation

struct Town: Codable {
    var nameTown: String
    var coords: Coordinate
    
    enum CodingKeys: String,CodingKey {
        case nameTown = "name"
        case coords
    }
}

struct Coordinate: Codable {
    var lat: Double?
    var lon: Double?
}
