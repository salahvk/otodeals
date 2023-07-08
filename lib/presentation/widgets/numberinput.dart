// import 'package:flutter/material.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';

// class AddButton extends StatefulWidget {
//   const AddButton({Key? key}) : super(key: key);

//   @override
//   State<AddButton> createState() => _AddButtonState();
// }

// class _AddButtonState extends State<AddButton> {
//   int up = 5000;

//   void increment() {
//     print(up);
//     setState(() {
//       if (up >= 5000 && up < 50000) {
//         up = up + 2000;
//         print(up);
//       }
//     });
//   }

//   void decrement() {
//     setState(() {
//       if (up > 5000) {
//         up = up - 2000;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 4.0, left: 0),
//       child: Row(
//         children: [
//           Container(
//               height: 28,
//               width: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ElevatedButton(
//                   onPressed: () {
//                     decrement();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colormanager.white,
//                   ),
//                   child: Text(
//                     "-",
//                     style: getMediumtStyle(
//                         color: Colormanager.black, fontSize: 20),
//                   ))),
//           Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Container(
//               width: 120,
//               height: 30,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colormanager.black),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Center(
//                   child: Text(
//                 '$up',
//                 style: getBoldStyle(color: Colormanager.black, fontSize: 14),
//               )),
//             ),
//           ),
//           Container(
//             height: 28,
//             width: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               //  color: Colormanager.primary,
//             ),
//             child: ElevatedButton(
//               onPressed: () {
//                 increment();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colormanager.white,
//               ),
//               child: Center(
//                   child: Icon(
//                 Icons.add,
//                 color: Colormanager.black,
//                 size: 18,
//               )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
