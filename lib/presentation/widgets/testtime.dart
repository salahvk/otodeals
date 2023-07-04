

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';

import 'package:otodeals/data/providers/vehicleprovider.dart';

import 'package:otodeals/data/repositories/vehiclelisting.dart';

import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class TestScreen extends StatefulWidget {

  const TestScreen ({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  static var countdownDuration = Duration(minutes:15);
 
  Duration duration = Duration();
 
  Timer? timer;
  bool countDown = true;
  int index=0;
  

  @override
  void initState() {
       final res=Provider.of<Vehicleprovider>(context,listen:false);
     WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
  await fetchSearchResults(context);
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
Widget build(BuildContext context) {
  final res=Provider.of<Vehicleprovider>(context,listen: true);

  return Container(
    
    child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      print('Start Time: ${res.vlist?.products?.data![index].starttime}');
print('End Time: ${res.vlist?.products?.data![index].endtime}');
      DateTime currentTime = DateTime.now();

      DateTime startTime = DateTime.parse(res.vlist?.products?.data![index].starttime??"0");
      DateTime endTime = DateTime.parse(res.vlist?.products?.data![index].endtime??"0");

      if (currentTime.isAfter(endTime)) {
        // Countdown has ended
        return Text('Countdown Ended');
      }

      Duration remainingTime = endTime.difference(currentTime);

      int days = remainingTime.inDays;
      int hours = remainingTime.inHours.remainder(24);
      int minutes = remainingTime.inMinutes.remainder(60);
      int seconds = remainingTime.inSeconds.remainder(60);

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeContainer(value: days.toString(), header: 'Days'),
          SizedBox(width:2),
          TimeContainer(value: hours.toString().padLeft(2, '0'), header: 'Hours'),
          SizedBox(width:2),
          TimeContainer(value: minutes.toString().padLeft(2, '0'), header: 'Minutes'),
          SizedBox(width:2),
          TimeContainer(value: seconds.toString().padLeft(2, '0'), header: 'Seconds'),
        ],
      );
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
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colormanager.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  value,
                  style: getBoldStyle(fontSize:10, color:Colormanager.black),
                ),
                 Text(
          header,
          style: getSemiBoldStyle(color: Colormanager.primary,fontSize:6),
        ),
              ],
            ),
          ),
        ),
       
       
      ],
    );
  }
}
