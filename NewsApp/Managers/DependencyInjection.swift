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


class DependencyInjection {
    
    static let sharedInstance = DependencyInjection()

    var container: Container!

    func startInjection()->Container{
        // DI
        container = Container() { container in
            // Model
            container.register(Networking.self) { _ in
                Network()
            }
            container.register(ArticleServicing.self) { r in
                ArticleService(network: r.resolve(Networking.self)!)
            }
            
            
            // ViewModel
            container.register(AtriclesSearchViewModeling.self) { r in
                ArticlesSearchViewModel(
                    network: r.resolve(Networking.self)!,
                    articleService: r.resolve(ArticleServicing.self)!)
            }
            
            // Views

            container.storyboardInitCompleted(UINavigationController.self) { _,_ in }
            container.storyboardInitCompleted(SearchViewController.self) { r,c in
                c.viewModel = r.resolve(AtriclesSearchViewModeling.self)!
            }
            container.storyboardInitCompleted(DetailsViewController.self) { _,_ in }

        }
        return container
    }
}
