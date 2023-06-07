

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen();

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  static var countdownDuration = Duration(minutes:15);
 
  Duration duration = Duration();
 
  Timer? timer;
  bool countDown = true;
  

  @override
  void initState() {
    var hours;
    var mints;
    var secs;
    hours = int.parse("01");
    mints = int.parse("20");
    secs = int.parse("59");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();
    reset();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:SafeArea(
        
        child: Container(
          height:100,
          
          
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 236, 236),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))

          ),
          
          width:MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Container(
                    margin: EdgeInsets.only(top:10, bottom:10),
                    child: buildTime()),
               
              ]),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }


  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => subTime());
  }

  

  void subTime() {
    final subSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds - subSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header:'HOURS'),
      SizedBox(
        width:6,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width:6,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

 

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
           height:30 ,
           width: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 236, 236), borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                time,
                style: getBoldStyle(
                   
                    color: Colors.black,
                    fontSize:15),
              ),
            ),
          ),
          SizedBox(
            height:3,
          ),
          Text(header, style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
        ],
      );
}
