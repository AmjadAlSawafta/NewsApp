//
//  ImageLoader.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit
import Nuke

class ImageLoader {
    
    class func load(with url:String?,into imageView:UIImageView){
        guard let urlString = url  , let url = URL(string: urlString) else {return}
        Nuke.loadImage(with: url, into: imageView)
    }
}
