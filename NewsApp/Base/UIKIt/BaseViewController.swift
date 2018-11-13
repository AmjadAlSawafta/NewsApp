//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    
    /**
      lazy var to be initilized when any view controller need it
     */
    lazy var disposeBag : DisposeBag = {
        return DisposeBag()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
