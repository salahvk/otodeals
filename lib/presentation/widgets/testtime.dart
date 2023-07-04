// import 'package:flutter/material.dart';
// import 'package:timer_builder/timer_builder.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Countdown Timer',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Countdown Timer'),
//         ),
//         body: Center(
//           child: CountdownCard(),
//         ),
//       ),
//     );
//   }
// }

// class CountdownCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
//           DateTime currentTime = DateTime.now();

//           DateTime startTime = DateTime.parse("2023-05-31 08:00:00");
//           DateTime endTime = DateTime.parse("2023-07-20 05:06:00");

//           if (currentTime.isAfter(endTime)) {
//             // Countdown has ended
//             return Text('Countdown Ended');
//           }

//           Duration remainingTime = endTime.difference(currentTime);

//           int days = remainingTime.inDays;
//           int hours = remainingTime.inHours.remainder(24);
//           int minutes = remainingTime.inMinutes.remainder(60);
//           int seconds = remainingTime.inSeconds.remainder(60);

//           if (days > 0) {
//             return Text(
//               '${days.toString()}d ${hours.toString().padLeft(2, '0')} ${minutes.toString().padLeft(2, '0')} ${seconds.toString().padLeft(2, '0')}',
//               style: TextStyle(fontSize: 24),
//             );
//           } else {
//             return Text(
//               '${hours.toString().padLeft(2, '0')} ${minutes.toString().padLeft(2, '0')} ${seconds.toString().padLeft(2, '0')}',
//               style: TextStyle(fontSize: 24),
//             );
//           }
//         }),
//       ),
//     );
 
//   }}