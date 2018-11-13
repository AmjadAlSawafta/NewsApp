//
//  UIViewControllerExtensions.swift
//  AppExtensions
//
//  Created by Al-sawafta, Amjad on 11/13/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation
import SafariServices

/**
 
 UIViewController extension
 
 */
public extension UIViewController {

    /**
     
     Show Safari Browser for given URL.
     
     - parameters:
        - url : string url to show it on Safari web view
     
     */
    
    public func showBroswer(for url:String){
        guard let url = URL(string: url) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
}
