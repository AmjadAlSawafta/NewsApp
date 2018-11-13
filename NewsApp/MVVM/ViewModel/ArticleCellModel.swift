//
//  ArticleCellModel.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit
import AppExtensions

protocol ArticleCellModeling {
    var imageUrl: String { get }
    var source: String { get }
    var title: String { get }
    var publishDate: String { get }
}

class ArticleCellModel: ArticleCellModeling {

    var imageUrl: String
    var source: String
    var title: String
    var publishDate: String
    
    
    init(imageUrl: String,source: String,title: String,publishDate: String) {
        self.imageUrl = imageUrl
        self.source = source
        self.title = title
        
        guard let dateFormatted = Date(string: publishDate, format: ServerDateFormat.dateTime.rawValue) else {
            self.publishDate =  "\("PUBLISHED_AT".localized) \(publishDate)"
            return
        }
        self.publishDate =  "\("PUBLISHED_AT".localized) \(dateFormatted.toString(format: ViewDateFormat.cell.rawValue))"
    }
}
