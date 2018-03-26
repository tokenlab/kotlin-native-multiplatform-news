//
//  TopArticlesMapper.swift
//  Presentation
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common

extension TopArticlesModels.Article {
    
    public init(article: CommonArticle) {
        self.title = article.title
        self.author = article.author ?? ""
        self.url = URL(string: article.url)
    }
}
