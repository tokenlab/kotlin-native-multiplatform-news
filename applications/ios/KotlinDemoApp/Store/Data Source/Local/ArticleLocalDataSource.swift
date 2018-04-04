//
//  ArticleLocalDataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 04/04/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common
import CouchbaseLite
import CouchbaseLiteSwift

class ArticleLocalDataSource: NSObject {
    let database: Database? = try? Database(name: "article-database")
}

extension ArticleLocalDataSource: CommonArticleDataSource {
    
    func loadTopArticles(country: String, category: String, complete: @escaping ([CommonArticle]) -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        fail()
    }
    
    func save(topArticles: [CommonArticle], complete: @escaping () -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        guard let database = database else {
            fail()
            return
        }
        
        do {
            try database.inBatch {
                try topArticles.forEach { article in
                    let newArticle = MutableDocument()
                        .setString(article.title, forKey: "title")
                        .setString(article.url, forKey: "url")
                        .setDate(Date(), forKey: "createdAt")
                    
                    try database.saveDocument(newArticle)
                    print("Saved top article \(article.title)")
                }
                complete()
            }
        } catch let error as NSError {
            print("Cannot save top articles: \(error)")
            fail()
        }
    }
}
