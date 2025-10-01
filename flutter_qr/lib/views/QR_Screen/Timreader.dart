import 'dart:async';

import 'package:flutter/material.dart';




class TimeCounter extends StatefulWidget {
  final  int minutescount;
   final VoidCallback onExpire;
  @override
  const TimeCounter({Key? key, required this.minutescount, required this.onExpire}) : super(key: key);
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  int seconds = 0;
  Timer? timer;


  int remainingSeconds = 0;


  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.minutescount * 60;

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        t.cancel();
        widget.onExpire();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = (seconds ~/ 60);
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(remainingSeconds),
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
    );
  }
}