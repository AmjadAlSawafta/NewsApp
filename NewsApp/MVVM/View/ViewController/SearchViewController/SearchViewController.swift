//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwinjectStoryboard

/**
 
 used to show user articles search results by his query on top search bar.
 It shows the result in dynmaic table view cells.
 
 */

class SearchViewController: BaseViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var tableView: BaseTableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: View Models

    var viewModel: AtriclesSearchViewModeling!
    var detailsViewModel:DetailsViewModeling!

    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBinding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     used to setup view controller basic views.
     */

    private func setupViews(){
        self.title = "NEWS".localized
    }
    
    /**
     setup IBOutlets as Observables and Observors.
     */
    private func setupBinding(){
        
        //searchBar text used as Observable to emit an event to AtriclesSearchViewModeling.
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        // tableView itemSelected is an Observable to emit cell selection event.
        tableView.rx.itemSelected
            .map { $0.row }
            .bind(to: viewModel.cellDidSelect)
            .disposed(by: disposeBag)
        
        // tableView contentOffset is an Observable to search bar hide keyboard event.
        tableView.rx.contentOffset
            .subscribe(onNext: { [unowned self] _ in
                if self.searchBar.isFirstResponder {
                    self.searchBar.resignFirstResponder()
                }
            }).disposed(by: disposeBag)
        
        // AtriclesSearchViewModeling is an Observor which listen to viewModel's cellModels changes
        // It called when any change apply on cellModels
        viewModel.cellModels
            .bind(to: tableView.rx.items(cellIdentifier: ArticleTableViewCell.Id, cellType: ArticleTableViewCell.self)) {
                i, cellModel, cell in
                cell.viewModel = cellModel
            }.disposed(by: disposeBag)
        
        // AtriclesSearchViewModeling presnet Details View Model when the user select a cell on the table view
        // It return the selected details view model.
        viewModel.presentDetails
            .subscribe(onNext: { [unowned self] viewModel in
                self.detailsViewModel = viewModel
                self.showDetails()
            }).disposed(by: disposeBag)
                
    }
    
   
    // MARK: - Navigation

    private func showDetails(){
        self.searchBar.resignFirstResponder()
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: DependencyInjection.sharedInstance.container)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        detailsVC.viewModel = self.detailsViewModel
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    

}
