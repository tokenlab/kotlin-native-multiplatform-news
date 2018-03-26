//
//  NibLoadableViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 27/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit

public protocol NibLoadableViewController {}

public extension NibLoadableViewController where Self: UIViewController {
    
    public static func fromNib() -> Self {
        return Self.init(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension UIViewController: NibLoadableViewController {}
