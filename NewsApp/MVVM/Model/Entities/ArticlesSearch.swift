//
//  ArticlesSearch.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import RxSwift
import Himotoki


enum ArticleSearch {
    case search(query: String,apiKey:String)
    
    var url: String {
        switch self {
        case .search(let query,let apiKey):
            return URL(string: Preferences.baseUrl)?.appendingPathComponent("everything")
                .appendingQueryParameters(["q":query,"apiKey":apiKey]).absoluteString ?? ""
        }
    }
}

protocol ArticleServicing {
    func userSearch(query: String) -> Observable<ArticlesResponse>
}

class ArticleService: ArticleServicing {
    private let network: Networking
    
    init(network: Networking) {
        self.network = network
    }
    
    func userSearch(query: String) -> Observable<ArticlesResponse> {
        let url = ArticleSearch.search(query: query, apiKey: Preferences.apiKey).url
        return network.request(method: .get, url: url, parameters: nil, type: ArticlesResponse.self)
    }
}
