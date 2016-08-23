package com.haoxin.hx.kotlinforandroid.commons

import android.os.Parcel
import android.os.Parcelable
import com.haoxin.hx.kotlinforandroid.commons.adapter.AdapterConstants
import com.haoxin.hx.kotlinforandroid.commons.adapter.ViewType
import com.haoxin.hx.kotlinforandroid.commons.extensions.createParcel

data class RedditNewsItem (
        val author: String,
        val title: String,
        val numComments: Int,
        val created: Long,
        val thumbnail: String,
        val url: String
) : ViewType, Parcelable {
    companion object {
        @JvmField @Suppress("unused")
        val CREATOR = createParcel { RedditNewsItem(it) }
    }

    protected constructor(parceIn: Parcel) : this(
            parceIn.readString(),
            parceIn.readString(),
            parceIn.readInt(),
            parceIn.readLong(),
            parceIn.readString(),
            parceIn.readString()
    )

    override fun writeToParcel(dest: Parcel, flags: Int) {
        dest.writeString(author)
        dest.writeString(title)
        dest.writeInt(numComments)
        dest.writeLong(created)
        dest.writeString(thumbnail)
        dest.writeString(url)
    }

    override fun describeContents() = 0

    override fun getViewType() = AdapterConstants.NEWS
}

data class RedditNews(
        val after: String,
        val before: String,
        val news: List<RedditNewsItem>
) : Parcelable {

    companion object {
        @JvmField @Suppress("unused")
        val CREATOR = createParcel { RedditNews(it) }
    }

    protected constructor(parceIn: Parcel): this(
            parceIn.readString(),
            parceIn.readString(),
            mutableListOf<RedditNewsItem>().apply {
                parceIn.readTypedList(this, RedditNewsItem.CREATOR)
            }
    )

    override fun writeToParcel(dest: Parcel, flags: Int) {
        dest.writeString(after)
        dest.writeString(before)
        dest.writeTypedList(news)
    }

    override fun describeContents() = 0
}
