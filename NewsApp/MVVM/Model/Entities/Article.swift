//
//  Article.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Himotoki

struct ArticleSource {
    let id : String?
    let name : String
}

struct Article {

    let source : ArticleSource
    let author : String
    let title : String
    let descriptionValue : String
    let url : String
    let imageUrl : String
    let publishedAt : String
    let content : String
}



extension ArticleSource: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> ArticleSource {
        return try ArticleSource(
            id: e <|? "id",
            name: e <| "name"
        )
    }
}



extension Article: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> Article {
        return try Article(
            source: e <| "source",
            author: e <| "author",
            title: e <| "title",
            descriptionValue: e <| "description",
            url: e <| "url",
            imageUrl: e <| "urlToImage",
            publishedAt: e <| "publishedAt",
            content: e <| "content"
        )
    }
}
