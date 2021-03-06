//
//  TopArticlesViewController.swift
//  Presentation
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import UIKit
import Common
import RxSwift
import RxCocoa

class TopArticlesViewController: BaseViewController {
    
    private let disposedBag: DisposeBag = DisposeBag()
    private var items: [TopArticlesModels.Article] = []
    
    var presenter: CommonTopArticlesPresenterProtocol!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        presenter.takeView(view_: self)
        setupTableView()
        requestTopArticles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        tableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = self.refreshControl
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        requestTopArticles()
    }
    
    func requestTopArticles() {
        let request = CommonGetTopArticlesRequest(country: "us", category: "business")
        presenter.getTopArticles(request: request)
    }
}

extension TopArticlesViewController: CommonTopArticlesViewProtocol {
    func displayLoadingTopArticles() {
        if items.isEmpty {
            showFullScreenLoading()
        }
    }
    
    func hideLoadingTopArticles() {
        hideFullScreenLoading()
        refreshControl.endRefreshing()
    }
    
    func display(articles: [CommonArticle]) {
        items = articles.map({ TopArticlesModels.Article(article: $0) })
        tableView.reloadData()
    }
    
    func displayEmptyArticles() {
        print("displayEmptyArticles")
    }
    
    func displayTopArticlesError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

extension TopArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let article = items[indexPath.row]
        guard let url = article.url else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
