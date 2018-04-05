package br.com.tokenlab.presentation.presenter

import br.com.tokenlab.domain.usecase.common.GetTopArticlesRequest
import br.com.tokenlab.domain.usecase.common.GetTopArticlesUseCase
import br.com.tokenlab.domain.usecase.common.UseCaseHandler
import br.com.tokenlab.presentation.contract.TopArticlesPresenterProtocol
import br.com.tokenlab.presentation.contract.TopArticlesViewProtocol

class TopArticlesPresenter(

        private val useCaseHandler: UseCaseHandler,
        private val getTopArticlesUseCase: GetTopArticlesUseCase

) : TopArticlesPresenterProtocol {

    private var view: TopArticlesViewProtocol? = null

    override fun takeView(view: TopArticlesViewProtocol) {
        this.view = view
    }

    override fun dropView() {
        this.view = null
    }

    override fun getTopArticles(request: GetTopArticlesRequest) {
        view?.displayLoadingTopArticles()

        useCaseHandler.executeUseCase(getTopArticlesUseCase, request, {
            view?.hideLoadingTopArticles()

            if (it.articles.isEmpty()) {
                view?.displayEmptyArticles()
            } else {
                view?.display(it.articles)
            }

        }, {
            view?.hideLoadingTopArticles()
            view?.displayTopArticlesError("Error loading top articles")
        })
    }
}