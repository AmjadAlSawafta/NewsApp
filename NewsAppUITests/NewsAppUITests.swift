//
//  NewsAppUITests.swift
//  NewsAppUITests
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import XCTest
import AppExtensions

class NewsAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        self.app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSearch() {
        let search = app.otherElements["SearchBar"]
        XCTAssert(search.exists, "Search bar does not exist")
        let query = "Apple"
       
        typeOnKeyboard(element: search, text: query)
        sleep(5) // wait until results return from API
        
        let tableView = app.tables["tableView"]
        XCTAssert(tableView.exists, "table View does not exist")
        tableView.tap()
        sleep(2) // wait until push view controller animation finished
        XCTAssert(app.images["DetailsImageView"].exists, "table does not show Details")                
    }
    
}

