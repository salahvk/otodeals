

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/data/providers/dataprovider.dart';
// import 'package:otodeals/data/repositories/homeweb.dart';

// import 'package:provider/provider.dart';

// class LivetimerScreen extends StatefulWidget {
//   final int index;
//   const LivetimerScreen(this.index, {super.key});

//   @override
//   _LivetimerScreenState createState() => _LivetimerScreenState();
// }

// class _LivetimerScreenState extends State<LivetimerScreen> {
//   static var countdownDuration = Duration(minutes:15);
 
//   Duration duration = Duration();
 
//   Timer? timer;
//   bool countDown = true;
//   int index=0;
  

//   @override
//   void initState() {
//        final homeres = Provider.of<DataProvider>(context, listen:false);
//      WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
//       await gethome(context);
//     });

     
//     int hours;
//     int mints;
//     int secs;
//     hours = int.parse(homeres.homemodel?.bidVehicles?[widget.index].hours.toString()??"0");
//     mints = int.parse(homeres.homemodel?.bidVehicles?[widget.index].minutes.toString()??"0");
//     secs = int.parse(homeres.homemodel?.bidVehicles?[widget.index].seconds.toString()??"0");
//     countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
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
        
//         child: Container(
//           height:30,
          
          
          
//           decoration: BoxDecoration(
//             color:Colormanager.background,
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(2),topRight: Radius.circular(2))

//           ),
          
//           width:MediaQuery.of(context).size.width/2.7,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
                
//                 Container(
                  
//                     child: buildTime()),
               
//               ]),
//         ),
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
//       SizedBox(width: 3,),
   
//       buildTimeCard(time: minutes, header: 'MINUTES'),
//       SizedBox(width: 3,),
   
//       buildTimeCard(time: seconds, header: 'SECONDS'),
//     ]);
//   }

 

//   Widget buildTimeCard({required String time, required String header}) =>
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//            height:17 ,
//            width:20,
//             decoration: BoxDecoration(
//                 color: Colormanager.background, borderRadius: BorderRadius.circular(4)),
//             child: Center(
//               child: Text(
//                 time,
//                 style: getBoldStyle(
                   
//                     color: Colors.black,
//                     fontSize:10),
//               ),
//             ),
//           ),
//           SizedBox(
//             height:3,
//           ),
//           Text(header, style:getSemiBoldStyle(color:Colormanager.primary,fontSize:5),),
//         ],
//       );
// }
