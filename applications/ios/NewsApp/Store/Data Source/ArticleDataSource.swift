//
//  ArticleDatasource.swift
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

class ArticleDataSource: NSObject {
    let provider: MoyaProvider<ArticleTarget>
    let disposeBag = DisposeBag()
    
    init(provider: MoyaProvider<ArticleTarget>) {
        self.provider = provider
    }
}

extension ArticleDataSource: CommonArticleDataSource {
    
    func loadTopArticles(country: String, category: String, complete: @escaping ([CommonArticle]) -> CommonStdlibUnit, fail: @escaping () -> CommonStdlibUnit) {
        
        provider.rx.request(.topArticles(country: country, category: category))
            .map([ArticleResponse].self, atKeyPath: "articles", using: JSONDecoder(), failsOnEmptyData: false)
            .map { (list) -> [CommonArticle] in
                return list.map({ $0.toArticle() })
            }
            .subscribe(onSuccess: { let _ = complete($0) },
                       onError: { error in let _ = fail() })
            .disposed(by: disposeBag)
    }
}
