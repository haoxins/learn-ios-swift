package com.haoxin.hx.kotlinankotodo

import android.app.Activity
import android.os.Bundle
import android.text.InputType.TYPE_CLASS_TEXT
import android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD
import android.view.Gravity
import android.widget.Button
import android.widget.EditText
import org.jetbrains.anko.*

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MainActivityUI().setContentView(this)
    }

    fun tryLogin(ui: AnkoContext<MainActivity>, name: CharSequence?, password: CharSequence?) {
        println(name)
    }
}

class MainActivityUI: AnkoComponent<MainActivity> {
    override fun createView(ui: AnkoContext<MainActivity>) = with(ui) {
        verticalLayout {
            padding = dip(32)

            val name = editText {
                hintResource = R.string.username_hint
            }
            val pass = editText {
                hintResource = R.string.password_hint
                inputType = TYPE_CLASS_TEXT or TYPE_TEXT_VARIATION_PASSWORD
            }

            button("Login") {
                onClick {
                    ui.owner.tryLogin(ui, name.text, pass.text)
                }
            }
        }
    }
}
