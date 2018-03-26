package br.com.tokenlab.data.repository

import br.com.tokenlab.data.datasource.ArticleDataSource
import br.com.tokenlab.domain.model.Article

class ArticleRepository(

        private val remoteDataSource: ArticleDataSource

) : ArticleDataSource {

    override fun loadTopArticles(apiKey: String, country: String, category: String, complete: (List<Article>) -> Unit, fail: () -> Unit) {
        remoteDataSource.loadTopArticles(apiKey, country, category, complete, fail)
    }
}