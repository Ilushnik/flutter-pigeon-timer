import 'package:pigeon_timer/pigeon.g.dart';
import 'package:rxdart/rxdart.dart';

class PigeonTimerListener extends TimerListenerApi{
  PublishSubject<int> onTickSubject = PublishSubject();
  PublishSubject<ComplexValue> onTickComplexSubject = PublishSubject();
  PigeonTimerListener() {
    TimerListenerApi.setUp(this);
  }

  @override
  void onTick(int? value) {
    if (value == null) return;
    onTickSubject.add(value);
  }
  @override
  void onTickComplex(ComplexValue? value) {
    if (value == null) return;
    onTickComplexSubject.add(value);
  }
}