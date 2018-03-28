//
//  Domain+Common.swift
//  NewsApp
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Swinject
import Common

public enum Domain {
    
    public static func setup(container: Container) {
        container.register(CommonGetTopArticlesUseCase.self) { r in
            CommonGetTopArticlesUseCase(articleDataSource: r.resolve(CommonArticleDataSource.self)!)
        }
        
        container.register(CommonSumUseCase.self) { _ in
            CommonSumUseCase()
        }
    }
}
