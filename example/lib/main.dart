import 'package:flutter/material.dart';
import 'package:pigeon_timer/pigeon.g.dart';
import 'dart:async';
import 'package:pigeon_timer/pigeon_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var counter = '';
  final timerApi = PigeonTimer();
  var platformVersion = '';
  final question = 'Ultimate Question of Life, The Universe, and Everything';
  var answerText = '-';

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  void onTick(int value) {
    debugPrint(value.toString());
    setState(() {
      counter = 'Counter is: ${value.toString()}';
    });
  }

  Future askQuestion() async {
    setState(() {
      answerText = 'Thinking...';
    });
    var answer = await timerApi.askImportantQuestion(Question(text: question));

    setState(() {
      answerText = answer.text;
    });
  }

  Future<void> initPlugin() async {
    var result = await timerApi.getPlatformVersion();
    timerApi.onTick().listen(onTick);
    timerApi.onTickComplex().listen(onTickComplex);
    setState(() {
      platformVersion = result ?? 'Unknown';
      counter = '-';
    });
  }

  void onTickComplex(ComplexValue complexObject) {
    debugPrint(
        'Value from complex object is ${complexObject.value}. Platform is: ${complexObject.platformName}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Platform version: $platformVersion'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Timer from native side', style: Theme.of(context).textTheme.titleLarge,),
              Text(counter, style: Theme.of(context).textTheme.titleLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      timerApi.init();
                    },
                    child: const Text('Init'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      timerApi.start();
                    },
                    child: const Text('start'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      timerApi.stop();
                    },
                    child: const Text('stop'),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
                height: 10,
              ),
              Text(question, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
              Text(answerText, style: Theme.of(context).textTheme.titleLarge),
              OutlinedButton(onPressed: askQuestion,
                child: const Text('Get Answer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
