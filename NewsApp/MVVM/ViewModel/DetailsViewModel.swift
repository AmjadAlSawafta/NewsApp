//
//  DetailsViewModel.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import AppExtensions

enum DetailsCellType {
    case image(url:String)
    case title(text:String,font:UIFont)
    case description(text:String,font:UIFont)
    case authorAndDate(author:String,date:String)
    
    func rowHeight(for tableView:UITableView)->CGFloat {
        
        switch self {
        case .image:return 248
        case .title(let text,let font): return text.heightWithConstrainedWidth(tableView.frame.size.width - textMargins, font: font) + 16 // 16 is top and bottom paddings
        case .description(let text,let font): return text.heightWithConstrainedWidth(tableView.frame.size.width - textMargins, font: font) + 16 // 16 is top and bottom paddings
        case .authorAndDate:return 71
        }
    }
}

let detailsFont = UIFont.boldSystemFont(ofSize: 17)
let descriptionFont = UIFont.systemFont(ofSize: 14)
let textMargins : CGFloat = 32

protocol DetailsViewModeling {
    var imageUrl:String {get}
    var title:String {get}
    var description:String {get}
    var author:String {get}
    var date:String {get}
    var source:String {get}
    var url:String {get}
    
    var cells:[DetailsCellType] {get}
}

class DetailsViewModel: DetailsViewModeling {
    
    
    var imageUrl:String
    var title:String
    var description:String
    var author:String
    var date:String
    var source:String
    var url:String
    var cells:[DetailsCellType]

    init(article: Article) {
        
        self.imageUrl = article.imageUrl
        self.title = article.title
        self.description = article.descriptionValue
        self.author = "\("AUTHOR".localized): \(article.author)"
        
        let dateFormatted = Date(string: article.publishedAt, format: ServerDateFormat.dateTime.rawValue)?.toString(format: ViewDateFormat.details.rawValue) ?? article.publishedAt
        self.date = "\("PUBLISHED_AT".localized): \(dateFormatted)"
        self.source = article.source.name
        self.url = article.url
        var cells = [DetailsCellType]()
        cells.append(.image(url: article.imageUrl))
        cells.append(.authorAndDate(author: article.author, date: article.publishedAt))
        cells.append(.title(text: self.title, font: detailsFont))
        cells.append(.description(text: self.description, font: descriptionFont))
        
        self.cells = cells
    }
    
    
}
