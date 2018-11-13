//
//  BaseImageView.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit

class BaseImageView: UIImageView {

    /**
     pass url to Image View for lazy loading
     */
    var url : String? = nil {
        didSet{
            ImageLoader.load(with: url, into: self)
        }
    }
}
