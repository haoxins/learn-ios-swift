package com.haoxin.hx.kotlinforandroid.news

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.haoxin.hx.kotlinforandroid.R
import com.haoxin.hx.kotlinforandroid.commons.RedditNewsItem
import com.haoxin.hx.kotlinforandroid.commons.extensions.inflate
import com.haoxin.hx.kotlinforandroid.news.adapter.NewsAdapter
import kotlinx.android.synthetic.main.news_fragment.*

class NewsFragment: Fragment() {
    private val newsManager by lazy { NewsManager() }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return container?.inflate(R.layout.news_fragment)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        news_list.setHasFixedSize(true)
        news_list.layoutManager = LinearLayoutManager(context)

        initAdapter()

        if (savedInstanceState == null) {
            requestNews()
        }
    }

    private fun requestNews() {
        (news_list.adapter as NewsAdapter).addNews(newsManager.getNews(""))
    }

    private fun initAdapter() {
        if (news_list.adapter == null) {
            news_list.adapter = NewsAdapter()
        }
    }
}
