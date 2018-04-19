//
//  ArticleLocalDataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 04/04/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common
import CouchbaseLiteSwift

class ArticleLocalDataSource: NSObject {
    static let databaseName: String = "article-database"
    
    var database: Database!
    
    override init() {
        self.database = try! Database(name: ArticleLocalDataSource.databaseName)
    }
}

extension ArticleLocalDataSource: CommonArticleDataSource {
    
    func getTopArticles(country: String, category: String, complete: @escaping ([CommonArticle]) -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        
        let query = QueryBuilder
            .select(SelectResult.all())
            .from(DataSource.database(database))
            .orderBy(Ordering.property("createdAt").ascending())
        do {
            var articles: [ArticleResponse] = []
            for row in try query.execute() {
                if let dict = row.dictionary(forKey: ArticleLocalDataSource.databaseName) {
                    let article = ArticleResponse(title: dict.string(forKey: ArticleResponse.CodingKeys.title.rawValue) ?? "",
                                                  author: dict.string(forKey: ArticleResponse.CodingKeys.author.rawValue),
                                                  url: dict.string(forKey: ArticleResponse.CodingKeys.url.rawValue) ?? "",
                                                  imageUrl: dict.string(forKey: ArticleResponse.CodingKeys.imageUrl.rawValue))
                    articles.append(article)
                }
            }
            _ = complete(articles)
        } catch {
            _ = fail()
        }
    }
    
    func save(topArticles: [CommonArticle], complete: @escaping () -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        do {
            // Delete old database and create new
            try database.delete()
            self.database = try Database(name: ArticleLocalDataSource.databaseName)
            
            try database.inBatch {
                try topArticles.forEach { article in
                    let newArticle = MutableDocument()
                        .setString("[DB] \(article.title)", forKey: ArticleResponse.CodingKeys.title.rawValue)
                        .setString(article.author, forKey: ArticleResponse.CodingKeys.author.rawValue)
                        .setString(article.url, forKey: ArticleResponse.CodingKeys.url.rawValue)
                        .setString(article.imageUrl, forKey: ArticleResponse.CodingKeys.imageUrl.rawValue)
                        .setDate(Date(), forKey: "createdAt")
                    
                    try database.saveDocument(newArticle)
                    print("ArticleLocalDataSource - Saved top article \(article.title)")
                }
                _ = complete()
            }
        } catch {
            _ = fail()
        }
    }
}
