//
//  ArticlesSearchViewModel.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import RxSwift
import RxCocoa

protocol AtriclesSearchViewModeling {
    
    // MARK: - Input
    var searchText: PublishSubject<String> { get set}
   var cellDidSelect: PublishSubject<Int> { get }

    
    // MARK: - Output
    var cellModels: Observable<[ArticleCellModeling]> { get }
    var presentDetails: Observable<DetailsViewModeling> { get }
}

class ArticlesSearchViewModel: AtriclesSearchViewModeling {

    // MARK: - Input
    var searchText: PublishSubject<String> = PublishSubject<String>()
    let cellDidSelect: PublishSubject<Int> = PublishSubject<Int>()
    
    
    // MARK: - Output
    let cellModels: Observable<[ArticleCellModeling]>
    var presentDetails: Observable<DetailsViewModeling>

    
    init(network: Networking,
         articleService: ArticleServicing) {
        
        let searchResults = searchText
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest { query in
                articleService.userSearch(query: query).catchErrorJustReturn(ArticlesResponse(status:"",totalResults:0,articles:[]))
            }.observeOn(MainScheduler.instance)
            .startWith(ArticlesResponse(status:"",totalResults:0,articles:[]))
            .share(replay: 1)
        
        cellModels = searchResults.map { userSearch in
            userSearch.articles.map { article in
                ArticleCellModel(imageUrl: article.imageUrl, source: article.source.name, title: article.title, publishDate: article.publishedAt)
            }
        }
        
        presentDetails = cellDidSelect
            .withLatestFrom(searchResults) { cell, results in
                (cell, results)
            }.map { cell, results in
                DetailsViewModel(article: results.articles[cell])
        }
        
        

    }
}
