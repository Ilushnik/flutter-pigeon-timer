import 'package:pigeon_timer/pigeon.g.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:rxdart/rxdart.dart';

import 'pigeon_timer_method_channel.dart';

abstract class PigeonTimerPlatform extends PlatformInterface {
  /// Constructs a PigeonTimerPlatform.
  PigeonTimerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PigeonTimerPlatform _instance = MethodChannelPigeonTimer();

  /// The default instance of [PigeonTimerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPigeonTimer].
  static PigeonTimerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PigeonTimerPlatform] when
  /// they register themselves.
  static set instance(PigeonTimerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }
  void initTimer() {
    throw UnimplementedError('initTimer() has not been implemented.');
  }
  void start() {
    throw UnimplementedError('start() has not been implemented.');
  }
  void stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }
  PublishSubject<int> onTick() {
    throw UnimplementedError('onTick() has not been implemented.');
  }
  PublishSubject<ComplexValue> onTickComplex() {
    throw UnimplementedError('onTickComplex() has not been implemented.');
  }
  Future<Answer> askImportantQuestion(Question question) {
    throw UnimplementedError('askImportantQuestion() has not been implemented.');
  }
}
