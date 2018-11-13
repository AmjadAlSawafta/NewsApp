//
//  UrlExtensions.swift
//  AppExtensions
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation

/**
 URL extensions
 */

public extension URL {

    /**
     append query string Parameters to URL object.
     
     - returns: URL after appending query strings.
     
     - parameters:
        - parameters: dictianry of string key and value for the qery strings.
     
     */
    
    public func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }

}
