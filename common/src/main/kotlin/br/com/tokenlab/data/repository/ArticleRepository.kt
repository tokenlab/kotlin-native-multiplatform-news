package br.com.tokenlab.data.repository

import br.com.tokenlab.data.datasource.ArticleDataSource
import br.com.tokenlab.domain.model.Article

class ArticleRepository(

        private val remoteDataSource: ArticleDataSource,
        private val localDataSource: ArticleDataSource

) : ArticleDataSource {

    override fun loadTopArticles(country: String, category: String, complete: (List<Article>) -> Unit, fail: () -> Unit) {

        localDataSource.loadTopArticles(country,category,{
            complete(it)

            remoteDataSource.loadTopArticles(country, category, {

                localDataSource.save(it, {}, {})
                complete(it)

            }, fail)
        }, {
            remoteDataSource.loadTopArticles(country, category, {

                localDataSource.save(it, {}, {})
                complete(it)

            }, fail)
        })

    }

    override fun save(topArticles: List<Article>, complete: () -> Unit, fail: () -> Unit) {
        localDataSource.save(topArticles, complete, fail)
    }
}