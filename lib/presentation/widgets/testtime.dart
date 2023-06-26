import 'package:flutter/material.dart';

import 'dart:async';


class Ttime extends StatefulWidget {
  @override
  _TtimeState createState() => _TtimeState();
}

class _TtimeState extends State<Ttime> {
  DateTime startTime = DateTime(2023, 1, 15, 12, 0, 0);
  DateTime endTime = DateTime(2023, 4, 1, 15, 30, 45);
  Duration? remainingTime;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    remainingTime = endTime.difference(startTime);
    startCountdown();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime!.inSeconds > 0) {
          remainingTime = (remainingTime! - Duration(seconds: 1));
        } else {
          countdownTimer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int remainingHours = remainingTime!.inHours % 24;
    int remainingMinutes = remainingTime!.inMinutes % 60;
    int remainingSeconds = remainingTime!.inSeconds % 60;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Countdown Timer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Remaining Time:',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                '${remainingTime?.inDays}d ${remainingHours}h ${remainingMinutes}m ${remainingSeconds}s',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
