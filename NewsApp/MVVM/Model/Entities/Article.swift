//
//  Article.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Himotoki

/**
 
 Entity for Article source inner object which return form articles search API.
 
 */

struct ArticleSource {
    let id : String?
    let name : String
}

/**
 
 Entity for Article JSON object which return form articles search API.
 
 */

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

/**
 
 Extension for Himotoki Pod impmelentation (decoding process)
 
 */

extension ArticleSource: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> ArticleSource {
        return try ArticleSource(
            id: e <|? "id",
            name: e <| "name"
        )
    }
}

/**
 
 Extension for Himotoki Pod impmelentation (decoding process)
 
 */

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
