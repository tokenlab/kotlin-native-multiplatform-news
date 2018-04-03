//
//  Common+Utils.swift
//  Store
//
//  Created by Wagner Augusto Silva Rodrigo on 28/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common

enum Utils {
    
    static func success<T>(_ success: @escaping (T) -> CommonStdlibUnit) -> ((T) -> Void) {
        let closure: (T) -> Void = { let _ = success($0) }
        return closure
    }
    
    static func error(_ errorHandler: @escaping () -> CommonStdlibUnit) -> ((Error) -> Void) {
        let closure: ((Error) -> Void) = { error in let _ = errorHandler()}
        return closure
    }
}
