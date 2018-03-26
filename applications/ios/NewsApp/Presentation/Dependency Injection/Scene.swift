//
//  Scene.swift
//  Presentation
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import RxSwift

public enum Scene {
    public static func setup(with container: Container) {
        TopArticlesConfigurator.setup(with: container)
    }
}

