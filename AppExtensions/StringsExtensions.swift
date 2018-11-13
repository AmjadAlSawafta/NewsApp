//
//  StringsExtensions.swift
//  AppExtensions
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation

public extension String {
    
    public var localized:String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return boundingBox.height
    }
}
