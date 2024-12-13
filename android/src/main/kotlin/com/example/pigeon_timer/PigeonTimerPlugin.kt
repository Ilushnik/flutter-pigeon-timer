package com.example.pigeon_timer

import android.os.Build

import io.flutter.embedding.engine.plugins.FlutterPlugin


class PigeonTimerPlugin: FlutterPlugin, TimerHostApi {
  private var stopwatch : StopwatchTimer? = null;
  private var timerListenerApi: TimerListenerApi? = null

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    TimerHostApi.setUp(binding.binaryMessenger, this)
    timerListenerApi = TimerListenerApi(binding.binaryMessenger)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    TimerHostApi.setUp(binding.binaryMessenger, null)
  }

  override fun getPlatformVersion(): String {
    return "Android " + Build.VERSION.RELEASE
  }

  override fun initTimer() {
    if (stopwatch != null) return;
    //Log.d("TAG","init native")
    stopwatch = StopwatchTimer()

    // Subscribe to the value change
    stopwatch?.onValueChanged = { newValue ->
      //return simple value
      timerListenerApi?.onTick(newValue.toLong()) {}
      // return as object class
      timerListenerApi?.onTickComplex(ComplexValue(
        newValue.toLong(),
        "Android"
      )) {}
    }
  }

  override fun start() {
    //Log.d("TAG","start native")
    stopwatch?.start();

  }

  override fun stop() {
   // Log.d("TAG","stop native")
    stopwatch?.stop();
  }

  override fun askImportantQuestion(question: Question, callback: (Result<Answer>) -> Unit) {
    val bigBrain = BigBrain()
    bigBrain.getAnswer = {
        answerText -> callback(Result.success(Answer(answerText)))
    }
    bigBrain.askQuestion(question.text)

  }
}
