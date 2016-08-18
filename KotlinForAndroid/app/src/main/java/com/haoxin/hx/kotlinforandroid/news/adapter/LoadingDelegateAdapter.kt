package com.haoxin.hx.kotlinforandroid.news.adapter

import android.support.v7.widget.RecyclerView
import android.view.ViewGroup
import com.haoxin.hx.kotlinforandroid.R
import com.haoxin.hx.kotlinforandroid.commons.adapter.ViewType
import com.haoxin.hx.kotlinforandroid.commons.extensions.inflate
import com.haoxin.hx.kotlinforandroid.commons.adapter.ViewTypeDelegateAdapter

class LoadingDelegateAdapter: ViewTypeDelegateAdapter {
    override fun onCreateViewHolder(parent: ViewGroup) = LoadingViewHolder(parent)

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, item: ViewType) {

    }

    class LoadingViewHolder(parent: ViewGroup): RecyclerView.ViewHolder(
            parent.inflate(R.layout.news_item_loading)
    )
}
