package br.com.tokenlab.presentation.contract

import br.com.tokenlab.domain.model.Article
import br.com.tokenlab.domain.usecase.common.GetTopArticlesRequest
import br.com.tokenlab.presentation.common.PresenterProtocol
import br.com.tokenlab.presentation.common.ViewProtocol

interface TopArticlesPresenterProtocol : PresenterProtocol {

    fun takeView(view: TopArticlesViewProtocol)
    fun dropView()
    fun getTopArticles(request: GetTopArticlesRequest)
}

interface TopArticlesViewProtocol : ViewProtocol {

    fun displayLoadingTopArticles()
    fun hideLoadingTopArticles()
    fun displayEmptyArticles()
    fun display(articles: List<Article>)
    fun displayTopArticlesError(message: String)
}