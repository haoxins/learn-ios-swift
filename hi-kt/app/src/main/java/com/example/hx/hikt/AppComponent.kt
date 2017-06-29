package com.example.hx.hikt

import dagger.Component
import com.example.hx.hikt.data.DataModule
import com.example.hx.hikt.ui.CounterViewModel
import javax.inject.Singleton

@Component(
        modules = arrayOf(
                AndroidModule::class,
                DataModule::class
        )
)
@Singleton
interface AppComponent {
    fun inject(into: CounterViewModel)
}