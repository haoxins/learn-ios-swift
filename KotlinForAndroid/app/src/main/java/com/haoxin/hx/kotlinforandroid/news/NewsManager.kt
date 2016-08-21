package com.haoxin.hx.kotlinforandroid.news

import com.haoxin.hx.kotlinforandroid.api.NewsAPI
import com.haoxin.hx.kotlinforandroid.commons.RedditNewsItem

class NewsManager {
    fun getNews(after: String, limit: String = "20"): List<RedditNewsItem> {
        val news = mutableListOf<RedditNewsItem>()
        for (i in 1..10) {
            news.add(RedditNewsItem(
                    "author$i",
                    "Title $i",
                    i,
                    1457207701L - i * 200,
                    "http://lorempixel.com/200/200/technics/$i",
                    "url"
            ))
        }

        return news
//        val client = NewsAPI()
//        val res = client.getNews(after, limit).execute()
//
//        if (res.isSuccessful) {
//            val dataRes = res.body().data
//            val news = dataRes.children.map {
//                val item = it.data
//                RedditNewsItem(item.author, item.title, item.num_comments,
//                        item.created, item.thumbnail, item.url)
//            }
//            return news
//        } else {
//            throw Throwable(res.message())
//        }
    }
}