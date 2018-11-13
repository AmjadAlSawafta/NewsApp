//
//  ArticlesSearch.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import RxSwift
import Himotoki

/**
 
 used to determine Articles Search API call details like path , query strings and request body.
 
 */

enum ArticleSearch {
    
    /**
      use 'everything' end point to fetch articles depend on query.
     */
    
    case search(query: String,apiKey:String)
    
    var url: String {
        switch self {
        case .search(let query,let apiKey):
           //append everything url path, query and api key to base url.
            return URL(string: Preferences.baseUrl)?.appendingPathComponent("everything")
                .appendingQueryParameters(["q":query,"apiKey":apiKey]).absoluteString ?? "" //
        }
    }
}

/**
 
  used to fetch articles user search by ArticleSearch enum cases.
  this protocol injected on Dependacies Injection shared container.
 
 */

protocol ArticleServicing {
    
    /**
     protocol method to do articles user search.
     
     - returns:
        Observable of type ArticlesResponse which emit an event when his value changed.
     
     - parameters:
        - query: the user query which typed on search bar.
     */
    
    func userSearch(query: String) -> Observable<ArticlesResponse>
}

/**
 
 ArticleServicing protocol implentation.
 
 */

class ArticleService: ArticleServicing {
    
    private let network: Networking
    
    /**
     public initilzer for ArticleService.
     
     - returns: an instance of ArticleService.
     - parameters:
        - netwrok: Networking instance.
    
     */
    
    init(network: Networking) {
        self.network = network
    }
    
    /**
     the implementation of ArticleServicing protocol
     
     - returns: an Observable of ArticleService type.
     - parameters:
        - query: the user query which typed on search bar.
     
     */
    
    func userSearch(query: String) -> Observable<ArticlesResponse> {
        let url = ArticleSearch.search(query: query, apiKey: Preferences.apiKey).url
        return network.request(method: .get, url: url, parameters: nil, type: ArticlesResponse.self)
    }
}
