//
//  XCTestExtensions.swift
//  NewsAppUITests
//
//  Created by Al-sawafta, Amjad on 11/14/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation
import XCTest

public extension XCTestCase {
    
    
    public func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
        let keyboard = XCUIApplication().keyboards.element
        while (true) {
            element.tap()
            if keyboard.exists {
                break;
            }
            
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }
    }
    
    /**
     this is a hack to reslove keyboard issue on UITesting.
     error : Neither element nor any descendant has keyboard focus.
     */
    public func typeOnKeyboard(element: XCUIElement, text:String){
        tapElementAndWaitForKeyboardToAppear(element: element)
        let array = Array(text)
        let keys = XCUIApplication().keys
        
        for char in array {
            keys[String(char)].tap()
        }
    }
}
