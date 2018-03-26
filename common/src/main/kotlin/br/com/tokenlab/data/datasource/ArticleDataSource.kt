package br.com.tokenlab.data.datasource

import br.com.tokenlab.domain.model.Article

interface ArticleDataSource {
    fun loadTopArticles(apiKey: String, country: String, category: String, complete: (List<Article>) -> Unit, fail: () -> Unit)
}