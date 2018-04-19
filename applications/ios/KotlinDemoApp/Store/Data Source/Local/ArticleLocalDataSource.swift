//
//  ArticleLocalDataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 04/04/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common

class ArticleLocalDataSource: NSObject {
    static let databaseName: String = "article-database"
}

extension ArticleLocalDataSource: CommonArticleDataSource {
    
    func getTopArticles(country: String, category: String, complete: @escaping ([CommonArticle]) -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        _ = complete([])
    }
    
    func save(topArticles: [CommonArticle], complete: @escaping () -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        _ = complete()
    }
}
