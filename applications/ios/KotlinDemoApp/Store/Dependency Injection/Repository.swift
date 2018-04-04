//
//  Repository.swift
//  Store
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import Common

public enum Repository {
    public static func setup(with container: Container) {
        container.register(CommonArticleDataSource.self) { r in
            return CommonArticleRepository.init(remoteDataSource: r.resolve(CommonArticleDataSource.self, name: DataSource.Name.remote)!, localDataSource: r.resolve(CommonArticleDataSource.self, name: DataSource.Name.local)!)
        }
    }
}

