


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
