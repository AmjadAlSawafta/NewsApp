//
//  ArticlesResponse.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Himotoki

struct ArticlesResponse {

    let status : String
    let totalResults : Int
    let articles : [Article]
}

extension ArticlesResponse: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> ArticlesResponse {
        return try ArticlesResponse(
            status: e <| "status",
            totalResults: e <| "totalResults",
            articles: e <|| "articles"
        )
    }
}
