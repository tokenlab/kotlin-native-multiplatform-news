package br.com.tokenlab.data.datasource

import br.com.tokenlab.domain.model.Article

interface ArticleDataSource {
    fun getTopArticles(country: String, category: String, complete: (List<Article>) -> Unit, fail: () -> Unit)

    fun save(topArticles: List<Article>, complete: () -> Unit, fail: () -> Unit)
}

