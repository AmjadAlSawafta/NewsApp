//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit

/**
 View Controller used to show Article Details into static table view.
 ## DetailsViewModeling
    is a mandetroy proparety to show Details.
 */

class DetailsViewController: UITableViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var sourceLabel: BaseLabel!
    @IBOutlet weak var imageView: BaseImageView!
    @IBOutlet weak var authorLabel: BaseLabel!
    @IBOutlet weak var dateLabel: BaseLabel!
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var descriptionLabel: BaseLabel!
    
    //MARK: View Model

    var viewModel:DetailsViewModeling!
    
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
     used to bind article details into IBOutlets
     */
    
    private func setupBinding(){
        sourceLabel.text = viewModel.source
        imageView.url = viewModel.imageUrl
        authorLabel.text = viewModel.author
        dateLabel.text = viewModel.date
        descriptionLabel.text = viewModel.description
        titleLabel.text = viewModel.title
        titleLabel.font = detailsFont
        descriptionLabel.font = descriptionFont
        // set accessibilityLabel for UI Testing
        self.imageView.accessibilityLabel = "DetailsImageView"
    }

    /**
     override heightForRowAt becuase title and description cells have a dynamic height depend on it lenghts.
     */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType =  viewModel.cells[indexPath.row]
        return cellType.rowHeight(for: tableView)
    }
    
    /**
     used to setup view controller basic views and set rightBarButtonItem to show article url on Safari browser.
     */
    
    private func setupViews(){
        self.title = "DETAILS".localized
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showDetailsUrl))
    }
    
    /**
     the selector of rightBarButtonItem to show article url on Safari browser.
     */
    
    @objc func showDetailsUrl(){
        self.showBroswer(for: viewModel.url)
    }
}

