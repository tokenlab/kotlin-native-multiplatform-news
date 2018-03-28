//
//  ArticleMapper.swift
//  Store
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Moya
import Common

class ArticleResponse: Codable {
    let title: String
    let author: String?
    let url: String
    let imageUrl: String?
    
}

extension ArticleResponse: CommonArticle {
}
