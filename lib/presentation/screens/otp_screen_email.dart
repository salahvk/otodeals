// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/core/util/animatedsnackbar.dart';

import 'package:otodeals/core/util/pinTheme.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/OTP/otpverification.dart';

import 'package:otodeals/data/providers/otp_provider.dart';
import 'package:otodeals/data/repositories/forget_password.dart';
// import 'package:otodeals/data/repositories/otp_mail.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPscreenmail extends StatefulWidget {
  const OTPscreenmail({Key? key}) : super(key: key);

  @override
  State<OTPscreenmail> createState() => _OTPscreenmailState();
}

class _OTPscreenmailState extends State<OTPscreenmail> {
  bool isResendButtonClicked = false;
  bool loading = false;
  verifyNow() async {
    final otpProvider = Provider.of<OTPProvider>(context, listen: false);
    print(otpProvider.getOtp?.otp.toString());
    print(Mailotpcontroller.otpcontroller.text);
    FocusManager.instance.primaryFocus?.unfocus();

    if (Mailotpcontroller.otpcontroller.text.length < 4 ||
            Mailotpcontroller.otpcontroller.text.isEmpty
        // Mailotpcontroller.otpcontroller.text.toString() !=
        //     otpProvider.getOtp?.otp.toString()
        ) {
      AnimatedSnackBar.material("Sorry!!!!",
          type: AnimatedSnackBarType.error,
          borderRadius: BorderRadius.circular(6),
          // brightness: Brightness.dark,
          duration: const Duration(seconds: 1));
    } else {
      await verifyOtpApi(context);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Mailotpcontroller.otpcontroller.text = '';

    // lang = Hive.box('LocalLan').get(
    //   'lang',
    // );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final otpProvider = Provider.of<OTPProvider>(context, listen: false);
    // final str = AppLocalizations.of(context)!;
    // final mob = Responsive.isMobile(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //     width: w * .6,
                  //     height: h * .2,
                  //     child: SvgPicture.asset(
                  //         'assets/logo/app_logo_green.svg')),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, h * .04, 0, 0),
                    child: Text("VERIFICATION CODE",
                        style: getSemiBoldStyle(
                            color: Colors.black, fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text(
                        "Please type the verification code send to \n ${otpProvider.email}",
                        textAlign: TextAlign.center,
                        style:
                            getMediumtStyle(color: Colors.black, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, h * .05, 10, 0),
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                separator: const SizedBox(
                  width: 5,
                ),
                length: 4,
                controller: Mailotpcontroller.otpcontroller,
                focusedPinTheme: focusedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : 'Pin is incorrect';
                // },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  print(pin);
                  print(Mailotpcontroller.otpcontroller);
                  // verifyNow();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, h * .05, 0, h * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't get the code?",
                      style: getRegularStyle(
                          color: const Color(0xff9f9f9f), fontSize: 15)),
                  InkWell(
                    onTap: () async {
                      postForgetpasswordData(context);
                      setState(() {
                        isResendButtonClicked = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        isResendButtonClicked = false;
                      });
                    },
                    child: isResendButtonClicked
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colormanager.black,
                              backgroundColor: Colormanager.white,
                            ),
                          )
                        : Text('Resend',
                            style: getRegularStyle(
                                color: Colormanager.primary, fontSize: 15)),
                  ),
                ],
              ),
            ),

            // * Verify Now Button
            InkWell(
              onTap: () {
                print("aaaa");
                verifyNow();
              },
              child: Container(
                width: w * .8,
                decoration: BoxDecoration(
                    color: Colormanager.primary,
                    borderRadius: BorderRadius.circular(12)),
                // height: 40,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "VERIFY NOW",
                      style: getMediumtStyle(
                          color: Colormanager.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: Responsive.isMobile(context) ? h * .24 : h * .04,
            // ),
          ],
        ),
      )),
    );
  }
}

Future verifyOtpApi(BuildContext context) async {
  
  final otpProvider = Provider.of<OTPProvider>(context, listen: false);
  //final provider = Provider.of<DataProvider>(context, listen: false);
  print(Mailotpcontroller.otpcontroller.text);
  print(otpProvider.getOtp?.otp.toString());
  try {
    final url =
        "${ApiEndpoint.otpemail}?email=${Forgetpasswordcontroller.emailController.text}&otp=${Mailotpcontroller.otpcontroller.text}";
    print(url);
    String s = 'abc';
    var response = await http.post(Uri.parse(url), headers: {
      "device-id": s,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // log(response.body);
      // print(jsonResponse);
      var customerdetails = OtpVerification.fromJson(jsonResponse);
      otpProvider.getOtpVerifiedData(customerdetails);
      final apitoken = otpProvider.otpVerification?.customerdetails?.apiToken;
      Hive.box("token").put('api_token', apitoken ?? '');
      print(apitoken);
      if (jsonResponse['result'] == false) {
        showAnimatedSnackBar(
            context, "Invalid otp,please request  again for otp");
        return jsonResponse;
      } else {
        Navigator.of(context).pushNamed(Routes.resetPassScreen);
        return jsonResponse;
      }

      // var otpVerifiedData = OtpVerification.fromJson(jsonResponse);
      // otpProvider.getOtpVerifiedData(otpVerifiedData);
      // final deviceid=otpProvider.otpVerification?.customerdetails?.deviceId;

      // print(deviceid);

      //Hive.box("token").put('api_token', apitoken ?? '');
      // Hive.box("deviceid").put('device-id',deviceid??'');
    } else {
      // print('Something went wrong');
    }
  } on Exception catch (_) {
    showAnimatedSnackBar(context, 'connection Timedout!!!');
  }
}
