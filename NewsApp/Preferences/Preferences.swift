//
//  Preferences.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit

class Preferences {

    class var baseUrl : String {
        return infoForKey(Keys.kKeyBaseUrl) ?? ""
    }
    
    class var apiKey : String {
        return infoForKey(Keys.KKeyAPIKey) ?? ""
    }
    
    class func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}
