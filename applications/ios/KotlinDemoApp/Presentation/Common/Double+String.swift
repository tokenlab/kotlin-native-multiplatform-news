//
//  Double+String.swift
//  Presentation
//
//  Created by Daniele Boscolo on 04/04/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation

extension Double {
    var stringValue: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter.string(from: NSNumber(value: self))
    }
}
