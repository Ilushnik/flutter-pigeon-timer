package com.example.pigeon_timer

import android.os.Handler
import android.os.Looper
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import java.util.Timer
import kotlin.concurrent.scheduleAtFixedRate

class BigBrain {
    var getAnswer: ((String) -> Unit)? = null
    fun askQuestion(questionText: String) {
        val handler = Handler(Looper.getMainLooper())

        // Emulate a 2-second delay and then return a value
        handler.postDelayed({
            getAnswer?.let {
                if (questionText == "Ultimate Question of Life, The Universe, and Everything") {
                    it("42")
                } else {
                    it("¯\\_(ツ)_/¯")
                }
            }
        }, 2000) //
    }
}