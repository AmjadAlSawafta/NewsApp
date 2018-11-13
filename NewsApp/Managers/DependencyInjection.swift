//
//  DependencyInjection.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

/**
  DependencyInjection class used for register Models , ViewModels and Views into shared container.
 It can be used to reslove the injected dependencies into another instnace.
 */

class DependencyInjection {

    /**
     Singleton for DependencyInjection class.It used to define shared instance of Container class.
     */
    static let sharedInstance = DependencyInjection()
    
    /**
     Shared Container for Dependency Injection Manager
     */
    var container: Container!

    
    /**
     startInjection method called once on App launch to inject all dependancies.
     - returns:
     The shared Container which used to inject all dependancies.
     */
    
    func startInjection()->Container{

        container = Container() { container in
            
            //MARK: Model Injection
            
            container.register(Networking.self) { _ in
                Network()
            }
            container.register(ArticleServicing.self) { r in
                ArticleService(network: r.resolve(Networking.self)!)
            }
            
            
            //MARK: ViewModel Injection
            
            container.register(AtriclesSearchViewModeling.self) { r in
                ArticlesSearchViewModel(
                    network: r.resolve(Networking.self)!,
                    articleService: r.resolve(ArticleServicing.self)!)
            }
            
            //MARK: Views Injection

            container.storyboardInitCompleted(UINavigationController.self) { _,_ in }
            container.storyboardInitCompleted(SearchViewController.self) { r,c in
                c.viewModel = r.resolve(AtriclesSearchViewModeling.self)!
            }
            container.storyboardInitCompleted(DetailsViewController.self) { _,_ in }

        }
        return container
    }
}
