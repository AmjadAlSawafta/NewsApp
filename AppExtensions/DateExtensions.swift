//
//  DateExtensions.swift
//  AppExtensions
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation

/**
 
 Date extension
 
 */

public extension Date {
    
    /**
     
     public Date init to convert string to date by given format.
     
        - returns: instance of optional date.
     
        - parameters:
            - string: date in string.
            - format: date fromat in string.
     */
    
    init?(string:String,format:String) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = format
        
        guard let date = dateFormatter.date(from: string) else {
            return nil
        }
        self = date
    }
    
    /**
     convert date to string by given format
     */
 
    func toString(format:String)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

//public enum for Server Date Formates
public enum ServerDateFormat : String {
    case time = "HH:mm:ss"
    case date = "yyyy-dd-mm"
    case dateTime = "yyyy-MM-dd'T'HH:mm:ssZ"    
}

//public enum for Show Dates in specific format
public enum ViewDateFormat : String {
    case cell = "hh:mm dd/MM/yyyy"
    case details = "dd MMM yyyy HH:mm"
}
