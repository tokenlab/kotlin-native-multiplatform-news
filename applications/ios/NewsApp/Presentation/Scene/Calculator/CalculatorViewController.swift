//
//  CalculatorViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 28/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Common

class CalculatorViewController: UIViewController {

    var presenter: CommonCalculatorPresenterProtocol!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calculator"
        
        presenter.takeView(view: self)
    }
    
    @IBAction func calculateButtonTouchUpInside(_ sender: Any) {
        let x = Float(firstTextField.text ?? "0") ?? 0.0
        let y = Float(secondTextField.text ?? "0") ?? 0.0

        let request = CommonSumUseCaseRequest(x: x, y: y)
        presenter.sum(request: request)
    }
}

extension CalculatorViewController: CommonCalculatorViewProtocol {
    
    func showResult(result: Float) {
        resultLabel.text = "\(result)"
    }
}
