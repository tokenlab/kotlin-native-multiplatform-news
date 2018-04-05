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
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case url
        case imageUrl
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.author = try? container.decode(String.self, forKey: .author)
        self.url = try container.decode(String.self, forKey: .url)
        self.imageUrl = try? container.decode(String.self, forKey: .imageUrl)
    }
    
    init(title: String, author: String?, url: String, imageUrl: String?) {
        self.title = title
        self.author = author
        self.url = url
        self.imageUrl = imageUrl
    }
}

extension ArticleResponse: CommonArticle {}
