// // ignore_for_file: use_build_context_synchronously, avoid_print

// import 'package:flutter/material.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/routes_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/core/util/pinTheme.dart';
// import 'package:pinput/pinput.dart';

// class OTPscreen extends StatefulWidget {
//   const OTPscreen({Key? key}) : super(key: key);

//   @override
//   State<OTPscreen> createState() => _OTPscreenState();
// }

// class _OTPscreenState extends State<OTPscreen> {
//   bool isResendButtonClicked = false;
//   bool loading = false;
//   String lang = '';

//   @override
//   void initState() {
//     super.initState();
//     // PhoneNumberControllers.otpCon.text = '';
//     // lang = Hive.box('LocalLan').get(
//     //   'lang',
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//     final w = MediaQuery.of(context).size.width;
//     // final otpProvider = Provider.of<OTPProvider>(context, listen: false);
//     // final str = AppLocalizations.of(context)!;
//     // final mob = Responsive.isMobile(context);

//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // SizedBox(
//                   //     width: w * .6,
//                   //     height: h * .2,
//                   //     child: SvgPicture.asset(
//                   //         'assets/logo/app_logo_green.svg')),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, h * .04, 0, 0),
//                     child: Text("VERIFICATION CODE",
//                         style: getSemiBoldStyle(
//                             color: Colors.black, fontSize: 16)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//                     child: Text(
//                         "Please type the verification code send to \n 9645 299 758",
//                         textAlign: TextAlign.center,
//                         style:
//                             getMediumtStyle(color: Colors.black, fontSize: 15)),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(10, h * .05, 10, 0),
//               child: Pinput(
//                 defaultPinTheme: defaultPinTheme,
//                 separator: const SizedBox(
//                   width: 5,
//                 ),
//                 length: 6,
//                 // controller: PhoneNumberControllers.otpCon,
//                 focusedPinTheme: focusedPinTheme,
//                 // validator: (s) {
//                 //   return s == '2222' ? null : 'Pin is incorrect';
//                 // },
//                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                 showCursor: true,
//                 onCompleted: (pin) {},
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.fromLTRB(0, h * .05, 0, h * .05),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Don't get the code?",
//                       style: getRegularStyle(
//                           color: const Color(0xff9f9f9f), fontSize: 15)),
//                   InkWell(
//                     onTap: () async {
//                       // getOtp(context, {otpProvider.countryCode},
//                       //     {otpProvider.phoneNo}, true);
//                       // setState(() {
//                       //   isResendButtonClicked = true;
//                       // });
//                       // await Future.delayed(const Duration(seconds: 2));
//                       // setState(() {
//                       //   isResendButtonClicked = false;
//                       // });
//                     },
//                     child:
//                         //  isResendButtonClicked
//                         //     ? const SizedBox(
//                         //         width: 20,
//                         //         height: 20,
//                         //         child: CircularProgressIndicator(
//                         //           strokeWidth: 2,
//                         //           color: ColorManager.primary3,
//                         //           backgroundColor: ColorManager.whiteColor,
//                         //         ),
//                         //       )
//                         //     :
//                         Text('Resend',
//                             style: getRegularStyle(
//                                 color: Colormanager.primary, fontSize: 15)),
//                   ),
//                 ],
//               ),
//             ),

//             // * Verify Now Button
//             InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, Routes.mainScreen);
//               },
//               child: Container(
//                 width: w * .8,
//                 decoration: BoxDecoration(
//                     color: Colormanager.primary,
//                     borderRadius: BorderRadius.circular(12)),
//                 // height: 40,
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       "VERIFY NOW",
//                       style: getMediumtStyle(
//                           color: Colormanager.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // SizedBox(
//             //   height: Responsive.isMobile(context) ? h * .24 : h * .04,
//             // ),
//           ],
//         ),
//       )),
//     );
//   }
// }
// //   verifyNow() async {
// //     FocusManager.instance.primaryFocus?.unfocus();
// //     final str = AppLocalizations.of(context)!;
// //     if (PhoneNumberControllers.otpCon.text.length < 6 ||
// //         PhoneNumberControllers.otpCon.text != '123456') {
// //       AnimatedSnackBar.material(str.o_snack,
// //               type: AnimatedSnackBarType.error,
// //               borderRadius: BorderRadius.circular(6),
// //               // brightness: Brightness.dark,
// //               duration: const Duration(seconds: 1))
// //           .show(
// //         context,
// //       );
// //     } else {
// //       setState(() {
// //         loading = true;
// //       });
// //       await verifyOtpApi();

// //       setState(() {
// //         loading = false;
// //       });
// //     }
// //   }

// //   verifyOtpApi() async {
// //     final otpProvider = Provider.of<OTPProvider>(context, listen: false);
// //     final provider = Provider.of<DataProvider>(context, listen: false);
// //     try {
// //       var response = await http.post(
// //           Uri.parse(
// //               "$apiUser/otp_verification?countrycode=${otpProvider.countryCode}&phone=${otpProvider.phoneNo}&otp=${otpProvider.getOtp?.oTP.toString()}"),
// //           headers: {"device-id": provider.deviceId ?? ''});
// //       if (response.statusCode == 200) {
// //         var jsonResponse = jsonDecode(response.body);
// //         log(response.body);

// //         var otpVerifiedData = OtpVerification.fromJson(jsonResponse);
// //         otpProvider.getOtpVerifiedData(otpVerifiedData);
// //         final apitoken = otpProvider.otpVerification?.customerdetails?.apiToken;
// //         print(apitoken);

// //         Hive.box("token").put('api_token', apitoken ?? '');
// //         await viewProfile(context);
// //         await getUserAddress(context);
// //         await getHome(context);
// //         await getChatList(context);
// //         provider.viewProfileModel?.userdetails?.userType == 'customer'
// //             ? null
// //             : await getServiceManProfileFun(context);

// //         otpProvider.getOtp!.action!.contains('registration')
// //             ? navigateToEdit(context)
// //             : navigateToHome(context);
// //       } else {
// //         print('Something went wrong');
// //       }
// //     } on Exception catch (_) {
// //       showSnackBar("Connection Timed Out", context);
// //     }
// //   }
// // }

// // navigateToHome(BuildContext context) {
// //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
// //     return const HomePage();
// //   }), (route) => false);
// // }

// // navigateToEdit(BuildContext context) {
// //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
// //     return EditProfileScreen();
// //   }), (route) => false);
// // }
