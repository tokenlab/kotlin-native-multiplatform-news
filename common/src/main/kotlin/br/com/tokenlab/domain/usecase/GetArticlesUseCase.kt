package br.com.tokenlab.domain.usecase.common

import br.com.tokenlab.data.datasource.ArticleDataSource
import br.com.tokenlab.domain.model.Article

class GetTopArticlesRequest(val apiKey: String, val country: String, val category: String) : UseCaseRequest

class GetTopArticlesResponse(val articles: List<Article>) : UseCaseResponse

class GetTopArticlesUseCase(private val articlesDataSource: ArticleDataSource) : UseCase<GetTopArticlesRequest, GetTopArticlesResponse>() {

    override fun executeUseCase(request: GetTopArticlesRequest) {
        articlesDataSource.loadTopArticles(request.apiKey, request.country, request.category, {
            val response = GetTopArticlesResponse(it)
            success(response)
        }, {
            error()
        })
    }
}