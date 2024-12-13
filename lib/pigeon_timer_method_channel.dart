import 'package:pigeon_timer/pigeon.g.dart';
import 'package:pigeon_timer/pigeon_timer_listener.dart';
import 'package:rxdart/rxdart.dart';

import 'pigeon_timer_platform_interface.dart';

/// An implementation of [PigeonTimerPlatform] that uses method channels.
class MethodChannelPigeonTimer extends PigeonTimerPlatform {

  final timerApi = TimerHostApi();
  final PigeonTimerListener timerListener = PigeonTimerListener();

  @override
  Future<String?> getPlatformVersion() async {
    return await timerApi.getPlatformVersion();
  }
  @override
  void initTimer() async {
    return await timerApi.initTimer();
  }
  @override
  void start() async {
    return await timerApi.start();
  }
  @override
  void stop() async {
    return await timerApi.stop();
  }
  @override
  PublishSubject<int> onTick() {
    return timerListener.onTickSubject;
  }
  @override
  PublishSubject<ComplexValue> onTickComplex() {
    return timerListener.onTickComplexSubject;
  }
  @override
  Future<Answer> askImportantQuestion(Question question) {
    return timerApi.askImportantQuestion(question);
  }
}
