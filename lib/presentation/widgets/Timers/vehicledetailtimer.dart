
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/providers/vehicledetails.dart';
import 'package:otodeals/data/repositories/homeweb.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';

import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class VehicledetailTimerScreen extends StatefulWidget {
  const VehicledetailTimerScreen({super.key});

  @override
  _VehicledetailTimerScreenState createState() => _VehicledetailTimerScreenState();
}

class _VehicledetailTimerScreenState extends State<VehicledetailTimerScreen> {
  static var countdownDuration = Duration(minutes: 15);

  // Duration duration = Duration();

  Timer? timer;
  bool countDown = true;
  int index = 0;
  late Duration duration;

  @override
  void initState() {
    final homeres = Provider.of<DataProvider>(context, listen: false);
    
  int? id=homeres.id;
 final vehres = Provider.of<Vehicledetailsprovider>(context, listen:false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await    getvehicledetails(context,id!);
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

      DateTime startTime = dateFormat
          .parse(vehres.vehdet?.vehicle?.starttime??DateTime.now().toString());
      DateTime endTime = dateFormat
          .parse(vehres.vehdet?.vehicle?.endtime ??DateTime.now().toString());

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
        // setState(() {
          duration = duration - Duration(seconds: 1);
        // });
      } else {
        // Countdown has ended
        timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   final vehres = Provider.of<Vehicledetailsprovider>(context, listen:false);
 

    return Container(
      child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
        DateTime currentTime = DateTime.now();
        final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

      DateTime startTime = dateFormat
          .parse(vehres.vehdet?.vehicle?.starttime??DateTime.now().toString());
      DateTime endTime = dateFormat
          .parse(vehres.vehdet?.vehicle?.endtime ??DateTime.now().toString());

        if (currentTime.isAfter(endTime)) {
          // Countdown has ended
          // return Text('Countdown Ended');
        
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


// class  TimerScreen2 extends StatefulWidget {
//   const TimerScreen2({super.key});

//   @override
//   _TimerScreen2State createState() => _TimerScreen2State();
// }

// class _TimerScreen2State extends State<TimerScreen2> {
    
//   static var countdownDuration = Duration();
 
//   Duration duration = Duration();
  
//   Timer? timer;
//   bool countDown = true;
  

//   @override
//   void initState() {
//     final hom=Provider.of<DataProvider>(context,listen: false);
//    int? id=hom.id;
//     //  final vehres = Provider.of<Vehicledetailsprovider>(context, listen:false);
//   getvehicledetails(context,id!);

//     // int hours;
//     // int mints;
//     // int secs;
//     // hours =int.parse (vehres.vehdet?.vehicle?.hours.toString()?? "0");
//     // mints = int.parse(vehres.vehdet?.vehicle?.minutes.toString()?? "0");
//     // secs = int.parse(vehres.vehdet?.vehicle?.seconds.toString()?? "0");
//     // countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
//     startTimer();
//     reset();
    
//     super.initState();
//   }
//   @override
// void dispose() {
//   timer?.cancel(); // Cancel the timer
//   super.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child:SafeArea(
        
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
              
//               Container(
//                   margin: EdgeInsets.only(top:1, bottom:10),
//                   child: buildTime()),
             
//             ]),
//       ),
//     );
//   }

//   Future<bool> _onWillPop() async {
//     final isRunning = timer == null ? false : timer!.isActive;
//     if (isRunning) {
//       timer!.cancel();
//     }
//     Navigator.of(context, rootNavigator: true).pop(context);
//     return true;
//   }

//   void reset() {
//     if (countDown) {
//       setState(() => duration = countdownDuration);
//     } else {
//       setState(() => duration = Duration());
//     }
//   }


//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (_) => subTime());
//   }

  

//   void subTime() {
//     const subSeconds = 1;
//     setState(() {
//       final seconds = duration.inSeconds - subSeconds;
//       if (seconds < 0) {
//         timer?.cancel();
//       } else {
//         duration = Duration(seconds: seconds);
//       }
//     });
//   }

//   Widget buildTime() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       buildTimeCard(time: hours, header:'HOURS'),
//       SizedBox(
//         width:10,
//       ),
//       buildTimeCard(time: minutes, header: 'MINUTES'),
//       SizedBox(
//         width:10,
//       ),
//       buildTimeCard(time: seconds, header: 'SECONDS'),
//     ]);
//   }

 

//   Widget buildTimeCard({required String time, required String header}) =>
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//            height:75 ,
//            width: 75,
//             decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 238, 236, 236), borderRadius: BorderRadius.circular(14)),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       time,
//                       style: getBoldStyle(
                         
//                           color: Colors.black,
//                           fontSize:30),
//                     ),
//                      SizedBox(
//                           height:6,
//                         ),
                    
//                     Text(header, style:getSemiBoldStyle(color:Colormanager.primary,fontSize:9),),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height:3,
//           ),
          
//         ],
//       );
// }
