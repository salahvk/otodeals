// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/routes_manager.dart';
// import 'package:otodeals/data/providers/dataprovider.dart';
// import 'package:otodeals/presentation/screens/intoductionlogo.dart';
// import 'package:otodeals/presentation/screens/welcome_screen.dart';
// import 'package:provider/provider.dart';
// // import 'package:hive/hive.dart';
// // import 'package:otodeals/core/routes_manager.dart';
// // import 'package:otodeals/data/repositories/homeweb.dart';


// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   bool loading = true;
//   String lang = '';
   
//   void initState() {
    
//     super.initState();
//        Future.delayed(Duration(seconds: 2), () {
//       // After the delay, navigate to the next screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) =>WelcomeScreen()),
//       );
//     });

//   //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//   //     initPlatformState(context);
//   //   });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final token = Hive.box('token').get('api_token');
//      print(token);
     
//     final initialRoutes= token != null ? Routes.mainScreen : Routes.welcomeScreen;
//   @override
//     final provider = Provider.of<DataProvider>(context, listen: false);
//     // InternetConnectionChecker().onStatusChange.listen((status) {
//     //   switch (status) {
//     //     case InternetConnectionStatus.connected:
//     //       provider.isInternetConnected = true;

//     //       break;
//     //     case InternetConnectionStatus.disconnected:
//     //       provider.isInternetConnected = false;

//     //       break;
//     //   }
//     // });
//     return Scaffold(
//         backgroundColor:Colormanager.white,
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [IntroductionLogo()],
//         )));
//   }
// }

