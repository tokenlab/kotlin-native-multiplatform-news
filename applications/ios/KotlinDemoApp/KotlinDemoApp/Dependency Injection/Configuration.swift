//
//  Configuration.swift
//  KotlinDemoApp
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Swinject
import Store
import Presentation

public enum Configuration {
    static var container: Container = Container()
    
    public static func setup() {
        Domain.setup(container: container)
        Store.DataSource.setup(with: container)
        Store.Repository.setup(with: container)
        Presentation.Scene.setup(with: container)
    }
}
