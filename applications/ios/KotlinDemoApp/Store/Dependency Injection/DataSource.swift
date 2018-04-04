//
//  DataSource.swift
//  Store
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import Moya
import Common

public enum DataSource {
    public static func setup(with container: Container) {
        container.register(MoyaProvider<ArticleTarget>.self) { _ in return MoyaProvider<ArticleTarget>() }
        
        container.register(CommonArticleDataSource.self, name: DataSource.Name.remote) { r in
            return ArticleRemoteDataSource.init(provider: r.resolve(MoyaProvider<ArticleTarget>.self)!)
        }
        
        container.register(CommonArticleDataSource.self, name: DataSource.Name.local) { r in
            return ArticleLocalDataSource()
        }
    }
}

extension DataSource {
    enum Name {
        static let remote = "remote"
        static let local = "local"
    }
}

