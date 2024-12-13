package com.example.pigeon_timer

import java.util.Timer
import kotlin.concurrent.scheduleAtFixedRate
import android.os.Handler
import android.os.Looper

class StopwatchTimer {
    private var intValue: Int = 0
    private var timer: Timer? = null
    var onValueChanged: ((Int) -> Unit)? = null

    // Starts the timer
    fun start() {
        // Invalidate any existing timer
        timer?.cancel()

        // Reset the counter
        intValue = 0

        // Create a new timer that ticks every second
        timer = Timer().apply {
            scheduleAtFixedRate(1000, 1000) {
                incrementValue()
            }
        }
    }

    // Stop method to stop the timer
    fun stop() {
        timer?.cancel()
        timer = null
    }

    // Method that gets called by the timer to increment the value
    private fun incrementValue() {
        intValue += 1
       // Log.d("TAG", "incrementValue: $intValue")
        // Run on the main thread
        Handler(Looper.getMainLooper()).post {
            // Call the callback function whenever the value changes
            onValueChanged?.invoke(intValue)
        }

    }
}
