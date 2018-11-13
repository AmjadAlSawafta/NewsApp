//
//  StringsExtensions.swift
//  AppExtensions
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation

/**
 String Extensions
 */
 
public extension String {
    
    /**
     used to return the localized of string key
     */
    
    public var localized:String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    /**
     
     used to determien the text height by the total width and font.
     
     - returns: text height.
     
     - parameters:
        - width: total width of label.
        - font: the used label font .
     
     */
    
    public func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.height
    }
}
