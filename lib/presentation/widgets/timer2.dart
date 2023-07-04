

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/homeweb.dart';

import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class TimerScreen extends StatefulWidget {

  const TimerScreen ({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static var countdownDuration = Duration(minutes:15);
 
  Duration duration = Duration();
 
  Timer? timer;
  bool countDown = true;
  int index=0;
  

  @override
  void initState() {
       final homeres = Provider.of<DataProvider>(context, listen:false);
     WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
      await gethome(context);
    });

     
    // int hours;
    // int mints;
    // int secs;
    // hours = int.parse(homeres.homemodel?.bidVehicles?[widget.index].hours.toString()??"0");
    // mints = int.parse(homeres.homemodel?.bidVehicles?[widget.index].minutes.toString()??"0");
    // secs = int.parse(homeres.homemodel?.bidVehicles?[widget.index].seconds.toString()??"0");
    // countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    // startTimer();
    // reset();
    
    super.initState();
  }
  @override
void dispose() {
  timer?.cancel(); // Cancel the timer
  super.dispose();
}

  @override
Widget build(BuildContext context) {
  final homeres = Provider.of<DataProvider>(context, listen: false);

  return Container(
    child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      DateTime currentTime = DateTime.now();

      DateTime startTime = DateTime.parse(homeres.homemodel?.nextAccutionTime?.nextstarttime.toString() ?? "0");
      DateTime endTime = DateTime.parse(homeres.homemodel?.nextAccutionTime?.nextendtime.toString() ?? "0");

      if (currentTime.isAfter(endTime)) {
        // Countdown has ended
        return Text('Countdown Ended');
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
            SizedBox(width: 2),
            TimeContainer(value: months.toString(), header: 'Months'),
            SizedBox(width: 2),
            TimeContainer(value: days.toString(), header: 'Days'),
          ],
        );
      } else if (months > 0) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeContainer(value: months.toString(), header: 'Months'),
            SizedBox(width: 2),
            TimeContainer(value: days.toString(), header: 'Days'),
            SizedBox(width: 2),
            TimeContainer(value: hours.toString(), header: 'Hours'),
          ],
        );
      } else if(days>0){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeContainer(value: days.toString(), header: 'Days'),
            SizedBox(width: 2),
            TimeContainer(value: hours.toString(), header: 'Hours'),
            SizedBox(width: 2),
            TimeContainer(value: minutes.toString(), header: 'Minutes'),
          ],
        );
      }
      else{
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeContainer(value: hours.toString(), header: 'Hours'),
            SizedBox(width: 2),
            TimeContainer(value: minutes.toString(), header: 'Minutes'),
               SizedBox(width: 2),
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

  TimeContainer({required this.value, required this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 75,
          height:75,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    value,
                    style: getBoldStyle(fontSize:17, color:Colormanager.black),
                  ),
                   Text(
              header,
              style: getSemiBoldStyle(color: Colormanager.primary,fontSize:12),
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
