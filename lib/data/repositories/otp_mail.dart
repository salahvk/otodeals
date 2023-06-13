
 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/data/models/OTP/getotp.dart';

import 'package:otodeals/data/providers/otp_provider.dart';
import 'package:provider/provider.dart';

final email=Mailotpcontroller.emailController.text;
final otp=Mailotpcontroller.otpcontroller.text;
String s='abc';



postEmailOtpData(BuildContext context,email,otp,resend)
async {
 // final String id=Hive.box(name);
 try{
  final otpProvider = Provider.of<OTPProvider>(context, listen: false);
  String url = "${ApiEndpoint.otpemail}?email=${otpProvider.email}&otp=${otpProvider.getOtp?.otp.toString()}";
  print(url);
  

    var response=await http.post(Uri.parse(url),headers:{"device-id":s});
    print(response);

    if(response.statusCode!=200){
      showAnimatedSnackBar(context,"something went wrong");
      return;

    }
    var jsonResponse=jsonDecode(response.body);
    print(jsonResponse);
    final result=jsonResponse["result"];
    if (result==false){
      try{
        final errormessage=jsonResponse["message"]["email"][0];
          showAnimatedSnackBar(context,"error");
      }catch (_) {}
       try {
        final errorMessage = jsonResponse["message"];
        showAnimatedSnackBar(context, errorMessage);
      } catch (_) {}
      return;
    }

    var getOtpData = GetOtp.fromJson(jsonResponse);
     otpProvider.getOtpData(getOtpData);
     
    if (resend == true) {
      return;
    }
    navigateToOtp(context);

    


  }on Exception catch(e){
    showAnimatedSnackBar(context,'Connection timed out!');
    print(e);
  }
}

navigateToOtp(context) {
  Navigator.pushNamed(context, Routes.mailotpScreen);
}