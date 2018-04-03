//
//  HomeViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 28/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet var newsButton: UIButton!
    @IBOutlet var calculatorButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        newsButton.rx.tap.asObservable()
        .map({ TopArticlesConfigurator.viewController })
        .bind(onNext: self.goToViewController)
        .disposed(by: disposeBag)
        
        calculatorButton.rx.tap.asObservable()
            .map({ CalculatorConfigurator.viewController })
            .bind(onNext: self.goToViewController)
            .disposed(by: disposeBag)

    }
    
    func goToViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
