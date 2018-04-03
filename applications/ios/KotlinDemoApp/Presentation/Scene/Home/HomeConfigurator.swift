//
//  HomeConfigurator.swift
//  Presentation
//
//  Created by Wagner Augusto Silva Rodrigo on 29/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation

public enum HomeConfigurator {

    public static var viewController: UIViewController {
        return HomeViewController.fromNib()
    }

}
