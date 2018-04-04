//
//  DatabaseDataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 04/04/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common
import CouchbaseLiteSwift

class DatabaseDataSource {
    var database: Database!
    
    init() {
        do {
            database = try Database(name: "kotlin-demo-app-database")
            print("Started database session")

        } catch let error as NSError {
            print("Cannot start a session: \(error)")
        }
    }
    
    func saveTopArticles(articles: [CommonArticle]) {
        do {
            try database.inBatch {
                try articles.forEach { article in
                    let newArticle = MutableDocument()
                        .setString(article.title, forKey: "title")
                        .setString(article.url, forKey: "url")
                        .setDate(Date(), forKey: "createdAt")
                    
                    try database.saveDocument(newArticle)
                    print("Saved top article \(article.title)")
                }
            }
        } catch let error as NSError {
            print("Cannot save top articles: \(error)")
        }
    }
}
