//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Al-sawafta, Amjad on 11/11/18.
//  Copyright © 2018 AlFuttam. All rights reserved.
//

import UIKit

/**
 used to show article details on table view cell.
 */
 
class ArticleTableViewCell: BaseTableViewCell {

    //MARK: IBOutlets
    
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var publishedDateLabel: BaseLabel!
    @IBOutlet weak var sourceLabel: BaseLabel!
    @IBOutlet weak var articleImageView: BaseImageView!
    
    //MARK: Cell ideneitifer

    static let Id = "ArticleTableViewCell"
    
    //MARK: view model which resposble for binding article details on cell IBOutlets

    var viewModel : ArticleCellModeling? = nil {
        didSet{
            guard let viewModel = viewModel else {return}
            titleLabel.text = viewModel.title
            publishedDateLabel.text = viewModel.publishDate
            sourceLabel.text = viewModel.source
            articleImageView.url = viewModel.imageUrl
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }

}
