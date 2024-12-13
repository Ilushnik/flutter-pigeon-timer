
import 'package:pigeon_timer/pigeon.g.dart';

import 'pigeon_timer_platform_interface.dart';

class PigeonTimer {
  Future<String?> getPlatformVersion() {
    return PigeonTimerPlatform.instance.getPlatformVersion();
  }
  void init() {
    return PigeonTimerPlatform.instance.initTimer();
  }
  void start() {
    return PigeonTimerPlatform.instance.start();
  }
  void stop() {
    return PigeonTimerPlatform.instance.stop();
  }
  Stream<int> onTick() {
    return PigeonTimerPlatform.instance.onTick().stream;
  }
  Stream<ComplexValue> onTickComplex() {
    return PigeonTimerPlatform.instance.onTickComplex().stream;
  }
  Future<Answer> askImportantQuestion(Question question)  {
    return PigeonTimerPlatform.instance.askImportantQuestion(question);
  }
}
