//
//  BaseViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 27/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {}

extension BaseViewController: LoadingProtocol {
    func showFullScreenLoading() {
        guard !self.view.subviews.contains(where: { $0 is LoadingView }) else { return }
        let loadingView = LoadingView(superView: self.view, style: .white)
        self.view.bringSubview(toFront: loadingView)
    }
    
    func hideFullScreenLoading() {
        guard
            let view = self.view.subviews.first(where: { $0 is LoadingView }),
            let loadingView = view as? LoadingView else {
                return
        }
        loadingView.removeFromSuperview()
    }
}
