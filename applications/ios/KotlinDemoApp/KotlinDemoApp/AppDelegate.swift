//
//  AppDelegate.swift
//  KotlinDemoApp
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Presentation
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])

        // Setup dependency injection
        Configuration.setup()
        
        // Setup window to work with dependency injection
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = HomeConfigurator.viewController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

