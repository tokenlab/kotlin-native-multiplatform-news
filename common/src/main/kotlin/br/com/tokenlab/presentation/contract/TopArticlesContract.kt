package br.com.tokenlab.presentation.contract

import br.com.tokenlab.domain.model.Article
import br.com.tokenlab.domain.usecase.common.GetTopArticlesRequest
import br.com.tokenlab.presentation.common.PresenterProtocol
import br.com.tokenlab.presentation.common.ViewProtocol

interface TopArticlesPresenterProtocol : PresenterProtocol {

    fun takeView(view: TopArticlesViewProtocol)
    fun dropView()
    fun loadTopArticles(request: GetTopArticlesRequest)
}

interface TopArticlesViewProtocol : ViewProtocol {

    fun showLoading()
    fun hideLoading()
    fun showTopArticles(articles: List<Article>)
    fun showTopArticlesError(message: String)
}