

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class  TimerScreen extends StatefulWidget {
  TimerScreen();

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static var countdownDuration = Duration(minutes:15);
 
  Duration duration = Duration();
  Duration duration1 = Duration();
  Timer? timer;
  bool countDown = true;
  

  @override
  void initState() {
    var hours;
    var mints;
    var secs;
    hours = int.parse("01");
    mints = int.parse("10");
    secs = int.parse("45");
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
        
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Container(
                  margin: EdgeInsets.only(top:1, bottom:10),
                  child: buildTime()),
             
            ]),
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
        width:10,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width:10,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

 

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
           height:75 ,
           width: 75,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 236, 236), borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      time,
                      style: getBoldStyle(
                         
                          color: Colors.black,
                          fontSize:30),
                    ),
                     SizedBox(
                          height:6,
                        ),
                    
                    Text(header, style:getSemiBoldStyle(color:Colormanager.primary,fontSize:9),),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height:3,
          ),
          
        ],
      );
}
