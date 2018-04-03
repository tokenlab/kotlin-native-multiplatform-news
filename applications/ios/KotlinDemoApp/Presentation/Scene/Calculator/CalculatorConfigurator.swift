//
//  CalculatorConfigurator.swift
//  Presentation
//
//  Created by Daniele Boscolo on 28/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import Common

public enum CalculatorConfigurator {
    private static var container = Container()
    
    static func setup(with container: Container) {
        self.container = container
        
        container.register(CommonCalculatorPresenterProtocol.self) { r in
            CommonCalculatorPresenter(useCaseHandler: CommonUseCaseHandler(), sumUseCase: r.resolve(CommonSumUseCase.self)!)
        }
        
        container.register(CommonCalculatorViewProtocol.self) { _ in
            CalculatorViewController.fromNib()
            }.initCompleted { (resolver, controller) in
                guard let viewController = controller as? CalculatorViewController else { return }
                viewController.presenter = resolver.resolve(CommonCalculatorPresenterProtocol.self)
        }
    }
    
    public static var viewController: UIViewController {
        guard let viewController = container.resolve(CommonCalculatorViewProtocol.self) as? CalculatorViewController else {
            fatalError("CalculatorViewController dependency injection not satisfied")
        }
        return viewController
    }
}

