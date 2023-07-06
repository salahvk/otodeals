import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/homeweb.dart';

import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static var countdownDuration = Duration(minutes: 15);

  // Duration duration = Duration();

  Timer? timer;
  bool countDown = true;
  int index = 0;
  late Duration duration;

  @override
  void initState() {
    final homeres = Provider.of<DataProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await gethome(context);
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

      DateTime startTime = dateFormat
          .parse(homeres.homemodel?.nextAccutionTime?.nextstarttime ??DateTime.now().toString());
      DateTime endTime = dateFormat
          .parse(homeres.homemodel?.nextAccutionTime?.nextendtime ??DateTime.now().toString());

      duration = endTime.difference(startTime);
      startTimer();
    });
    super.initState();
  }

  @override
  // void dispose() {
  //   timer?.cancel(); // Cancel the timer
  //   super.dispose();
  // }
  void startTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (duration.inSeconds > 0) {
        setState(() {
          duration = duration - Duration(seconds: 1);
        });
      } else {
        // Countdown has ended
        timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeres = Provider.of<DataProvider>(context, listen: false);

    return Container(
      child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
        DateTime currentTime = DateTime.now();
        final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

        DateTime startTime = DateTime.parse(
            homeres.homemodel?.nextAccutionTime?.nextstarttime.toString() ??
                DateTime.now().toString());
        DateTime endTime = DateTime.parse(
            homeres.homemodel?.nextAccutionTime?.nextendtime.toString() ??DateTime.now().toString());

        if (currentTime.isAfter(endTime)) {
          // Countdown has ended
          // return Text('Countdown Ended');
          gethome(context);
        }

        Duration remainingTime = endTime.difference(currentTime);

        int years = remainingTime.inDays ~/ 365;
        int months = remainingTime.inDays.remainder(365) ~/ 30;
        int days = remainingTime.inDays.remainder(30);
        int hours = remainingTime.inHours.remainder(24);
        int minutes = remainingTime.inMinutes.remainder(60);
        int seconds = remainingTime.inSeconds.remainder(60);

        if (years > 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: years.toString(), header: 'Years'),
              SizedBox(width: 20),
              TimeContainer(value: months.toString(), header: 'Months'),
              SizedBox(width: 20),
              TimeContainer(value: days.toString(), header: 'Days'),
            ],
          );
        } else if (months > 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: months.toString(), header: 'Months'),
              SizedBox(width: 20),
              TimeContainer(value: days.toString(), header: 'Days'),
              SizedBox(width: 20),
              TimeContainer(value: hours.toString(), header: 'Hours'),
            ],
          );
        } else if (days > 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: days.toString(), header: 'Days'),
              SizedBox(width: 20),
              TimeContainer(value: hours.toString(), header: 'Hours'),
              SizedBox(width: 20),
              TimeContainer(value: minutes.toString(), header: 'Minutes'),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: hours.toString(), header: 'Hours'),
              SizedBox(width: 20),
              TimeContainer(value: minutes.toString(), header: 'Minutes'),
              SizedBox(width: 20),
              TimeContainer(value: seconds.toString(), header: 'Seconds'),
            ],
          );
        }
      }),
    );
  }
}

class TimeContainer extends StatelessWidget {
  final String value;
  final String header;

  const TimeContainer({super.key, required this.value, required this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 240, 240),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    value,
                    style:
                        getBoldStyle(fontSize: 35, color: Colormanager.black),
                  ),
                  Text(
                    header,
                    style: getSemiBoldStyle(
                        color: Colormanager.primary, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
