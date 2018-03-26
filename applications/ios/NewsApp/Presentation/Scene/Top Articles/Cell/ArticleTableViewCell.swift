//
//  ArticleTableViewCell.swift
//  Presentation
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Common

class ArticleTableViewCell: UITableViewCell {
    static let identifier: String = "ArticleTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func configure(with article: TopArticlesModels.Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author
    }
}
