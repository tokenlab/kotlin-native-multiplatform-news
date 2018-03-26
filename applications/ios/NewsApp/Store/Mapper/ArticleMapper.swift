//
//  ArticleMapper.swift
//  Store
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Moya
import Common

struct ArticleResponse: Decodable {
    let title: String
    let author: String?
    let url: String
    
    fileprivate enum CodingKeys: String, CodingKey {
        case title = "title"
        case author = "author"
        case url = "url"
    }
}

extension ArticleResponse {
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try values.decode(String.self, forKey: .title)
        self.author = try? values.decode(String.self, forKey: .author)
        self.url = try values.decode(String.self, forKey: .url)
    }
}

extension ArticleResponse {
    func toArticle() -> CommonArticle {
        return CommonArticle(title: self.title,
                             author: self.author,
                             url: self.url)
    }
}
