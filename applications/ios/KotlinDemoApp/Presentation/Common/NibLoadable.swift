//
//  NibLoadable.swift
//  Presentation
//
//  Created by Daniele Boscolo on 27/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit

protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension UITableViewCell: NibLoadable {}
