//
//  LoadingView.swift
//  Presentation
//
//  Created by Daniele Boscolo on 27/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import PureLayout

class LoadingView: UIView {

    fileprivate lazy var indicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    convenience init(superView: UIView, style: UIActivityIndicatorViewStyle) {
        self.init(frame: superView.bounds)
        
        self.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.autoCenterInSuperview()
        
        superView.addSubview(self)
        self.autoPinEdgesToSuperviewEdges()
    }
}
