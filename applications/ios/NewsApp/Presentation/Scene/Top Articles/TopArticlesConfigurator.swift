//
//  TopArticlesConfigurator.swift
//  Presentation
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import Common

public enum TopArticlesConfigurator {
    private static var container = Container()
    
    static func setup(with container: Container) {
        self.container = container
        
        container.register(CommonTopArticlesPresenterProtocol.self) { r in
            CommonTopArticlesPresenter(useCaseHandler: CommonUseCaseHandler(), getTopArticlesUseCase: r.resolve(CommonGetTopArticlesUseCase.self)!)
        }
        
        container.register(CommonTopArticlesViewProtocol.self) { _ in
            TopArticlesViewController.fromNib()
            }.initCompleted { (resolver, controller) in
                guard let viewController = controller as? TopArticlesViewController else { return }
                viewController.presenter = resolver.resolve(CommonTopArticlesPresenterProtocol.self)
        }
    }
    
    public static var viewController: UIViewController {
        guard let viewController = container.resolve(CommonTopArticlesViewProtocol.self) as? TopArticlesViewController else {
            fatalError("TopArticlesViewController dependency injection not satisfied")
        }
        return viewController
    }
}

