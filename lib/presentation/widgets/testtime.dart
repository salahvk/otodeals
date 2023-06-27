import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';

class AttendanceScreen1 extends StatefulWidget {
  @override
  _AttendanceScreen1State createState() => _AttendanceScreen1State();
}

class _AttendanceScreen1State extends State<AttendanceScreen1> {
  static const Duration countdownDuration = Duration(minutes: 15);
  late DateTime startDate;
  late DateTime endDate;
  late Duration remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = startDate.add(countdownDuration);
    remainingTime = endDate.difference(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        remainingTime = endDate.difference(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = remainingTime.inDays;
    int hours = remainingTime.inHours.remainder(24);
    int minutes = remainingTime.inMinutes.remainder(60);
    int seconds = remainingTime.inSeconds.remainder(60);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 236, 236),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: buildTime(days, hours, minutes, seconds),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    timer.cancel();
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  Widget buildTime(int days, int hours, int minutes, int seconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final daysStr = days > 0 ? '$days Days ' : '';
    final hoursStr = twoDigits(hours);
    final minutesStr = twoDigits(minutes);
    final secondsStr = twoDigits(seconds);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(daysStr, style: TextStyle(fontWeight: FontWeight.bold)),
        buildTimeCard(time: hoursStr, header: 'HOURS'),
        SizedBox(width: 6),
        buildTimeCard(time: minutesStr, header: 'MINUTES'),
        SizedBox(width: 6),
        buildTimeCard(time: secondsStr, header: 'SECONDS'),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 236, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        Text(
          header,
          style: TextStyle(
            color: Colormanager.primary,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
