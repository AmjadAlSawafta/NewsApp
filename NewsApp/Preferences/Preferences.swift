//
//  Preferences.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit

/**
 Preferences used to get all app preferences like base url , apiKey ..etc.
 and it used to for main bundle methods
 */
class Preferences {

    /**
     return base Url for APIs which exists in info.plist file
    */
 
    class var baseUrl : String {
        return infoForKey(Keys.kKeyBaseUrl) ?? ""
    }
    
    /**
     return api key for APIs which exists in info.plist file
     */
    
    class var apiKey : String {
        return infoForKey(Keys.KKeyAPIKey) ?? ""
    }
    
    /**
     get any value from info.plist file by key.
     
     - returns:
      return optional String for info.plist proparty value by key
     
     - parameters:
     key: The info.plist proparty key to get the value
     
     */
    class func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}
