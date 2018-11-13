//
//  UIViewControllerExtensions.swift
//  AppExtensions
//
//  Created by Al-sawafta, Amjad on 11/13/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import Foundation
import SafariServices

public extension UIViewController {

    public func showBroswer(for url:String){
        guard let url = URL(string: url) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
}
