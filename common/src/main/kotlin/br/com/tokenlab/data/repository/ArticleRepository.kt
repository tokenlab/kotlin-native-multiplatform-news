package br.com.tokenlab.data.repository

import br.com.tokenlab.data.datasource.ArticleDataSource
import br.com.tokenlab.domain.model.Article

class ArticleRepository(

        private val remoteDataSource: ArticleDataSource,
        private val localDataSource: ArticleDataSource

) : ArticleDataSource {

    override fun getTopArticles(country: String, category: String, complete: (List<Article>) -> Unit, fail: () -> Unit) {

        remoteDataSource.getTopArticles(country, category, {
            localDataSource.save(it, {}, {})
            complete(it)

        }, {
            localDataSource.getTopArticles(country,category,{
                complete(it)
            }, {
                fail()
            })
        })
    }

    override fun save(topArticles: List<Article>, complete: () -> Unit, fail: () -> Unit) {
        localDataSource.save(topArticles, complete, fail)
    }
}
