// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:otodeals/data/providers/dataprovider.dart';
// import 'package:otodeals/data/repositories/loginweb.dart';
// import 'package:otodeals/data/repositories/profileweb.dart';
// import 'package:provider/provider.dart';

// Future<void> initPlatformState(BuildContext context) async {
//   final provider = Provider.of<DataProvider>(context, listen: false);
  

  
//   final apiToken = Hive.box("token").get('api_token');

//   print(apiToken);
//   // if (provider.isInternetConnected == false) {
//   //   Navigator.pushNamed(context, Routes.noConnectionPage);
//   //   return;
//   // }

//   if (apiToken == null) {
//     log("API token is null");
//     postLoginData(context);
//   } else {
//     await (context);
   
//    await postprofileData(context);

//     // gotoHomePage(context);
//   }
//   print(provider.deviceId);
// }

// // gotoNextPage(BuildContext context) async {
// //   // getlocalLanguage(context);
// //   await getLanguageData(context);
// //   await getCountriesData(context);

// //   Timer(const Duration(seconds: 1), () {
// //     Navigator.pushReplacementNamed(context, Routes.introductionScreen);
// //   });
// // }

// // gotoHomePage(BuildContext context) async {
// //   await getLanguageData(context);
// //   getlocalLanguage(context);
// //   Timer(const Duration(seconds: 1), () {
// //     Navigator.pushReplacementNamed(context, Routes.homePage);
// //   });
// // }