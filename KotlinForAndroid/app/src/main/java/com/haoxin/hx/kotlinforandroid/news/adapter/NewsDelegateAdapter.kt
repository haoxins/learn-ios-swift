package com.haoxin.hx.kotlinforandroid.news.adapter

import android.support.v7.widget.RecyclerView
import android.view.SurfaceHolder
import android.view.ViewGroup
import com.haoxin.hx.kotlinforandroid.R
import com.haoxin.hx.kotlinforandroid.commons.RedditNewsItem
import com.haoxin.hx.kotlinforandroid.commons.adapter.ViewType
import com.haoxin.hx.kotlinforandroid.commons.adapter.ViewTypeDelegateAdapter
import com.haoxin.hx.kotlinforandroid.commons.extensions.getFriendlyTime
import com.haoxin.hx.kotlinforandroid.commons.extensions.inflate
import com.haoxin.hx.kotlinforandroid.commons.extensions.loadImg
import kotlinx.android.synthetic.main.news_item.view.*

class NewsDelegateAdapter: ViewTypeDelegateAdapter {
    override fun onCreateViewHolder(parent: ViewGroup): RecyclerView.ViewHolder {
        return TurnsViewHolder(parent)
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, item: ViewType) {
        holder as TurnsViewHolder
        holder.bind(item as RedditNewsItem)
    }

    class TurnsViewHolder(parent: ViewGroup): RecyclerView.ViewHolder(
            parent.inflate(R.layout.news_item)) {

        fun bind(item: RedditNewsItem) = with(itemView) {
            img_thumbnail.loadImg(item.thumbnail)
            description.text = item.title
            author.text = item.title
            comments.text = "${item.numComments} comments"
            time.text = item.created.getFriendlyTime()
        }
    }
}