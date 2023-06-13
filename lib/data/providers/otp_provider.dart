import 'package:flutter/cupertino.dart';
import 'package:otodeals/data/models/OTP/getotp.dart';
import 'package:otodeals/data/models/OTP/otpverification.dart';


class OTPProvider with ChangeNotifier {
  

  String? email;

  void getemail(value) {
    email = value;
    notifyListeners();
  }

  GetOtp? getOtp;

  void getOtpData(value) {
    getOtp = value;
    notifyListeners();
  }

  OtpVerification? otpVerification;

  void getOtpVerifiedData(value) {
    otpVerification = value;
    notifyListeners();
  }

}