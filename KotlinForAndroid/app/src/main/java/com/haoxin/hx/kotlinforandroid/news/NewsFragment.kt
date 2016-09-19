package com.haoxin.hx.kotlinforandroid.news

import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.haoxin.hx.kotlinforandroid.R
import com.haoxin.hx.kotlinforandroid.commons.InfiniteScrollListener
import com.haoxin.hx.kotlinforandroid.commons.RedditNews
import com.haoxin.hx.kotlinforandroid.commons.RedditNewsItem
import com.haoxin.hx.kotlinforandroid.commons.extensions.inflate
import com.haoxin.hx.kotlinforandroid.news.adapter.NewsAdapter
import kotlinx.android.synthetic.main.news_fragment.*

class NewsFragment: Fragment() {
    private var redditNews: RedditNews? = null
    private val newsManager by lazy { NewsManager() }

    companion object {
        private val KEY_REDDIT_NEWS = "redditNews"
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return container?.inflate(R.layout.news_fragment)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        news_list.apply {
            setHasFixedSize(true)
            val linearLayout = LinearLayoutManager(context)
            layoutManager = linearLayout
            clearOnScrollListeners()
            addOnScrollListener(InfiniteScrollListener({ requestNews() }, linearLayout))
        }

        initAdapter()

        if (savedInstanceState != null && savedInstanceState.containsKey(KEY_REDDIT_NEWS)) {
//            redditNews = savedInstanceState.get(KEY_REDDIT_NEWS) as RedditNews
//            (news_list.adapter as NewsAdapter).clearAndAddNews(redditNews!!.news)
            requestNews()
        } else {
            requestNews()
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        val news = (news_list.adapter as NewsAdapter).getNews()
        if (redditNews != null && news.size > 0) {
            outState.putParcelable(KEY_REDDIT_NEWS, redditNews?.copy(news = news))
        }
    }

    private fun requestNews() {
        // todo ...
        (news_list.adapter as NewsAdapter).addNews(newsManager.getNews(""))
    }

    private fun initAdapter() {
        if (news_list.adapter == null) {
            news_list.adapter = NewsAdapter()
        }
    }
}
