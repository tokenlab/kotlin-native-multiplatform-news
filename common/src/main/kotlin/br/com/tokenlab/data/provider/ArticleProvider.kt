package br.com.tokenlab.data.provider

import br.com.tokenlab.data.common.Provider

/**
 * Created by danieleboscolo on 10/04/18.
 */

class ArticleProvider: Provider {

    override val baseUrl: String
        get() = "https://newsapi.org/v2/"

    val apiKey: String
        get() = "032be3c3d700450c90c5ae280dd06576"

    enum class Endpoints(val string: String) {
        TopArticles("top-headlines")
    }
}
