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

    override fun loadTopArticles(request: GetTopArticlesRequest) {

        view?.showLoading()

        useCaseHandler.executeUseCase(getTopArticlesUseCase, request, {
            view?.hideLoading()
            view?.showTopArticles(it.articles)
        }, {
            view?.hideLoading()
            view?.showTopArticlesError("Error loading top articles")
        })
    }
}