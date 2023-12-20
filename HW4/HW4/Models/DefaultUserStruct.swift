//
//  DefaultUserStruct.swift
//  HW4
//
//  Created by Mac on 20.12.2023.
//

import Foundation
import UIKit

struct DefaultUser {
    let id: String
    let firstname: String
    let lastname: String
    var profileSettings: UserProfileSettings
    // Другие свойства, если нужно
}

struct UserProfileSettings {
    var profileBackgroundColor: UIColor
    // Другие настройки профиля
}
