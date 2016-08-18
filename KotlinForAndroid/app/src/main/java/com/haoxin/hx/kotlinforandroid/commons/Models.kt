package com.haoxin.hx.kotlinforandroid.commons

import com.haoxin.hx.kotlinforandroid.commons.adapter.AdapterConstants
import com.haoxin.hx.kotlinforandroid.commons.adapter.ViewType

data class RedditNewsItem (
        val author: String,
        val title: String,
        val numComments: Int,
        val created: Long,
        val thumbnail: String,
        val url: String
) : ViewType {
    override fun getViewType() = AdapterConstants.NEWS
}
