package br.com.tokenlab.domain.model

interface Article {
        val title: String
        val author: String?
        val url: String
	val imageUrl: String?
}
