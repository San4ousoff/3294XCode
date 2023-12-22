//
//  AppTheme.swift
//  HW4
//
//  Created by Mac on 20.12.2023.
//

import UIKit

enum AppTheme: Int {
    case standard, gray, dark

    var backgroundColor: UIColor {
        switch self {
            case .standard: return UIColor.white
            case .gray: return UIColor.yellow
            case .dark: return UIColor.black
        }
    }

    var textColor: UIColor {
        switch self {
            case .standard: return UIColor.black
            case .gray: return UIColor.black
            case .dark: return UIColor.white
        }
    }

    var buttonColor: UIColor {
        switch self {
            case .standard: return UIColor.white
            case .gray: return UIColor.yellow
            case .dark: return UIColor.white
        }
    }
}

extension UserDefaults {
    var appTheme: AppTheme? {
        get {
            guard let themeValue = UserDefaults.standard.value(forKey: "appTheme") as? Int else { return nil }
            return AppTheme(rawValue: themeValue)
        }
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: "appTheme")
        }
    }

    func setAppTheme(_ theme: AppTheme, forOwnerID ownerID: String) {
        set(theme.rawValue, forKey: "appTheme_\(ownerID)")
    }
    
    func appTheme(forOwnerID ownerID: String) -> AppTheme {
        let themeValue = integer(forKey: "appTheme_\(ownerID)")
        return AppTheme(rawValue: themeValue) ?? .standard
    }

    func setOwnerID(_ ownerID: String) {
        set(ownerID, forKey: "ownerID")
    }
    
    func getOwnerID() -> String? {
        return string(forKey: "ownerID")
    }
}
