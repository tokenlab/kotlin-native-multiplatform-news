//
//  ArticleRemoteDatasource.swift
//  Store
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common
import Moya
import RxMoya
import RxSwift

class ArticleRemoteDataSource: NSObject {
    let provider: MoyaProvider<ArticleTarget>
    let disposeBag = DisposeBag()
    
    init(provider: MoyaProvider<ArticleTarget>) {
        self.provider = provider
    }
}

extension ArticleRemoteDataSource: CommonArticleDataSource {
    
    func loadTopArticles(country: String, category: String, complete: @escaping ([CommonArticle]) -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        
        provider.rx.request(.topArticles(country: country, category: category))
            .map([ArticleResponse].self, atKeyPath: "articles", using: JSONDecoder(), failsOnEmptyData: false)
            .map({ $0 as [CommonArticle] })
            .handle(onSuccess: complete, onError: fail, disposeBag: disposeBag)
    }
    
    func save(topArticles: [CommonArticle], complete: @escaping () -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        // nothing to do
    }
}
