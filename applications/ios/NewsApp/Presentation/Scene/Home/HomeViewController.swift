//
//  HomeViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 28/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Table view data source

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "featureCell") else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Calculator"
        default:
            cell.textLabel?.text = "News"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = CalculatorConfigurator.viewController
            navigationController?.pushViewController(viewController, animated: true)
        default:
            let viewController = TopArticlesConfigurator.viewController
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
