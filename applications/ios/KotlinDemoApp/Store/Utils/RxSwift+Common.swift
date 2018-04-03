//
//  RxSwift+Common.swift
//  Store
//
//  Created by Wagner Augusto Silva Rodrigo on 28/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Common
import RxSwift

extension PrimitiveSequenceType where Self.TraitType == RxSwift.SingleTrait {
    
    func handle(onSuccess successHandler: @escaping (ElementType) -> CommonStdlibUnit, onError errorHandler: @escaping () -> CommonStdlibUnit, disposeBag: DisposeBag) {
        self.subscribe(onSuccess: Utils.success(successHandler),
                       onError: Utils.error(errorHandler))
            .disposed(by: disposeBag)
    }
}
