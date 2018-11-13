//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {

    @IBOutlet weak var sourceLabel: BaseLabel!
    @IBOutlet weak var imageView: BaseImageView!
    @IBOutlet weak var authorLabel: BaseLabel!
    @IBOutlet weak var dateLabel: BaseLabel!
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var descriptionLabel: BaseLabel!
    
    var viewModel:DetailsViewModeling!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBinding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupBinding(){
        sourceLabel.text = viewModel.source
        imageView.url = viewModel.imageUrl
        authorLabel.text = viewModel.author
        dateLabel.text = viewModel.date
        descriptionLabel.text = viewModel.description
        titleLabel.text = viewModel.title
        titleLabel.font = detailsFont
        descriptionLabel.font = descriptionFont
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType =  viewModel.cells[indexPath.row]
        return cellType.rowHeight(for: tableView)
    }
    
    private func setupViews(){
        self.title = "DETAILS".localized
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showDetailsUrl))
    }
    
    @objc func showDetailsUrl(){
        self.showBroswer(for: viewModel.url)
    }
}

