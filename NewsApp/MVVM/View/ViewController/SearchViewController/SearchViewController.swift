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

class SearchViewController: BaseViewController {

    @IBOutlet weak var tableView: BaseTableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    var viewModel: AtriclesSearchViewModeling!
    var detailsViewModel:DetailsViewModeling!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBinding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setupViews(){
        self.title = "NEWS".localized
    }
    
    private func setupBinding(){
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        
        tableView.rx.itemSelected
            .map { $0.row }
            .bind(to: viewModel.cellDidSelect)
            .disposed(by: disposeBag)
        
        tableView.rx.contentOffset
            .subscribe(onNext: { [unowned self] _ in
                if self.searchBar.isFirstResponder {
                    self.searchBar.resignFirstResponder()
                }
            }).disposed(by: disposeBag)
        
        viewModel.cellModels
            .bind(to: tableView.rx.items(cellIdentifier: ArticleTableViewCell.Id, cellType: ArticleTableViewCell.self)) {
                i, cellModel, cell in
                cell.viewModel = cellModel
            }.disposed(by: disposeBag)
        
        
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
