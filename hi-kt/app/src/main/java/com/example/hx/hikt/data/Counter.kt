package com.example.hx.hikt.data

import android.arch.persistence.room.Entity
import android.arch.persistence.room.Index
import android.arch.persistence.room.PrimaryKey
import java.text.FieldPosition

@Entity(
        tableName = "counter"
) data class Counter (
        @PrimaryKey(autoGenerate = true) val id: Long,
        val name: String = "",
        val position: Long = 0,
        val count: Long = 0
)
