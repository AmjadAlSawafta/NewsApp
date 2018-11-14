//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import NewsApp

/**
 This XCTestCase class used to test search API call results
 */

class NewsAppTests: XCTestCase {
    
    
    var network: Network!
    var disposeBag: DisposeBag!
    var service: ArticleService!
    
    let searchQuery = "apple"
    
    
    var expectaion:XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        network = Network()
        disposeBag = DisposeBag()
        service = ArticleService(network: network)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        network = nil
        disposeBag = nil
        service = nil
        super.tearDown()
    }
    
    /**
     test Search API call by ArticleService and make sure it return results
     */
    func testSearchAPI() {
        
        expectaion = XCTestExpectation(description: "test News API")
        
        var userSearch: ArticlesResponse? = nil
        service.userSearch(query: searchQuery)
            .subscribe(onNext: {
                userSearch = $0
                self.expectaion.fulfill()
            }).disposed(by: disposeBag)
        
        
        wait(for: [expectaion], timeout: 5.0)
        XCTAssert(userSearch != nil, "cannot parse ArticlesResponse")
        XCTAssert(userSearch!.articles.count > 0, "News api did not return articles")
    }
    
    
    
}
