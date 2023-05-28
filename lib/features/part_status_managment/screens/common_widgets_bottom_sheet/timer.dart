import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class TimerClass extends StatefulWidget {
  const TimerClass({super.key});

  @override
  State<TimerClass> createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  String _formatTimer(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    final minutesStr = (minutes % 60).toString().padLeft(2, '0');
    final secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTimer(_seconds),
      style: CfTextStyles.getTextStyle(TStyle.h1_600),
    );
  }
}
