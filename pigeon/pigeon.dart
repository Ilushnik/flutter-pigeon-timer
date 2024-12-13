import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/src/main/kotlin/com/example/pigeon_timer/Pigeon.g.kt',
  kotlinOptions: KotlinOptions(package: "com.example.pigeon_timer"),
  swiftOut: 'ios/Classes/Pigeon.g.swift',
  swiftOptions: SwiftOptions(),

  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  dartPackageName: 'com_example_pigeon_timer',
))

@HostApi()
abstract class TimerHostApi {
  String getPlatformVersion();
  //method name "init" not allowed in swift. We use "initTimer" instead
  void initTimer();
  void start();
  void stop();

  @async
  Answer askImportantQuestion(Question question);
}

@FlutterApi()
abstract class TimerListenerApi {
  void onTick(int? value);
  void onTickComplex(ComplexValue? value);
}

class ComplexValue {
  late int? value;
  late String? platformName;
}

class Question {
  late String text;
}
class Answer {
  late String text;
}