import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/homeweb.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class AttendanceScreen extends StatefulWidget {
  final int index;
  const AttendanceScreen(this.index, {super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  static var countdownDuration = Duration(minutes: 15);

  Duration duration = Duration();

  Timer? timer;
  bool countDown = true;
  int index = 0;

  @override
  void initState() {
    final res = Provider.of<DataProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // await gethome(context);
       final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
           DateTime startTime = dateFormat.parse(res.homemodel?.bidVehicles![widget.index].starttime??DateTime.now().toString());
      DateTime endTime = dateFormat.parse(res.homemodel?.bidVehicles![widget.index].endtime??DateTime.now().toString());

       
      duration = endTime.difference(startTime);
      startTimer();

      
    });
    super.initState();
  }
  
  @override
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
   
   final res=Provider.of<DataProvider>(context,listen:false);
     final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime startTime = dateFormat.parse(res.homemodel?.bidVehicles![widget.index].starttime??DateTime.now().toString());
      DateTime endTime = dateFormat.parse(res.homemodel?.bidVehicles![widget.index].endtime??DateTime.now().toString());


    return Container(
      child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
        DateTime currentTime = DateTime.now();
          final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime startTime = dateFormat.parse(res.homemodel?.bidVehicles![widget.index].starttime??DateTime.now().toString());
      DateTime endTime = dateFormat.parse(res.homemodel?.bidVehicles![widget.index].endtime??DateTime.now().toString());
      // print(res.vlist?.products?.data![index].starttime??"0");

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
            
              TimeContainer(value: months.toString(), header: 'Months'),
            
              TimeContainer(value: days.toString(), header: 'Days'),
            ],
          );
        } else if (months > 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: months.toString(), header: 'Months'),
             
              TimeContainer(value: days.toString(), header: 'Days'),
             
              TimeContainer(value: hours.toString(), header: 'Hours'),
            ],
          );
        } else if (days > 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: days.toString(), header: 'Days'),
             
              TimeContainer(value: hours.toString(), header: 'Hours'),
            
              TimeContainer(value: minutes.toString(), header: 'Minutes'),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(value: hours.toString(), header: 'Hours'),
              
              TimeContainer(value: minutes.toString(), header: 'Minutes'),
           
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
          width: 43,
          // height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 246, 245, 245),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  value,
                  style:
                      getSemiBoldStyle(fontSize:13, color: Colormanager.black),
                ),
                const SizedBox(height:4,),
               
                Text(
                  header,
                  style: getMediumtStyle(
                      color: Colormanager.primary, fontSize:9),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

  
