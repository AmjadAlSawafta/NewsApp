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
    
    /**
     Use Nuke Pod to make simple tasks like loading images into views extremely simple
     
     - parameters
        - url: the image url
        - into: the Image View to load UIImage in it.
     */
    
    class func load(with url:String?,into imageView:UIImageView){
        guard let urlString = url  , let url = URL(string: urlString) else {return}
        Nuke.loadImage(with: url, into: imageView)
    }
}
