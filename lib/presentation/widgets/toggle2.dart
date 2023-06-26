// import 'package:flutter/material.dart';

// import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/presentation/screens/bottomNavPages/search.dart';




// class Toggle2 extends StatefulWidget {
  

//   @override
//   State<Toggle2> createState() => _Toggle2State();
// }
// const double width = 90.0;
// const double height = 25.0;
// const double loginAlign = -1;
// const double signInAlign = 1;
// const Color selectedColor = Colors.black;
// const Color normalColor = Colors.white;





// class _Toggle2State extends State<Toggle2> {
//   late double xAlign;
//   late Color loginColor;
//   late Color signInColor;


//   @override
//   void initState() {
//     super.initState();
//     xAlign = loginAlign;
//     loginColor = selectedColor;
//     signInColor = normalColor;
    
//   }
//    void navigateToPageOne() {
//      setState(() {
//       xAlign = signInAlign;
//       loginColor =selectedColor;
//       signInColor = normalColor;
//     });
//     Navigator.of(context).push(FadePageRoutes(page:searchs()));
//   }

//   void navigateToPageTwo() {
//      setState(() {
//       xAlign = loginAlign;
//       signInColor = selectedColor;
//       loginColor = normalColor;
//     });
//     // Navigator.of(context).push(FadePageRoutes(page: Bidsearch()));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//          width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 169, 20, 20),
//             borderRadius: BorderRadius.all(
//               Radius.circular(30.0),
//             ),
//           ),
//           child: Stack(
//             children: [
//               AnimatedAlign(
//                 alignment: Alignment(xAlign, 0),
//                 duration: Duration(milliseconds: 300),
//                 child: Padding(
//                   padding: const EdgeInsets.all(3.0),
//                   child: Container(
//                     width: width * 0.5,
//                     height: height,
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                  alignment: Alignment(-1, 0),
//                 child: GestureDetector(
//                   onTap:navigateToPageOne,   
                       
                  
//                   child: Container(
//                     width: width * 0.5,
//                     color: Colors.transparent,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'BUY',
//                       style:getSemiBoldStyle(
//                         color: loginColor,
                        
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                  alignment: Alignment(1, 0),
//                 child: GestureDetector(
//                   onTap: 
//                     navigateToPageTwo,
//                   child: Container(
//                     width: width * 0.5,
//                     color: Colors.transparent,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'BID',
//                       style:getSemiBoldStyle(
//                         color: signInColor,
                        
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )

//       ),
//     );
//   }
// }
// class FadePageRoutes<T> extends PageRouteBuilder<T> {
//   final Widget page;

//   FadePageRoutes({required this.page})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) {
//             return FadeTransition(
//               opacity: animation,
//               child: page,
//             );
//           },
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) {
//             return FadeTransition(
//               opacity: animation.drive(Tween<double>(begin: 0.0, end: 1.0)),
//               child: child,
//             );
//           },
//         );
// }