import 'package:hive/hive.dart';

String endpoint = "http://192.168.29.44:8010";
// String endpoint = "https://projects.techoriz.in/ottodeals/public";
// String api="$endpoint/api";
String api = "$endpoint/api/customer";
String deviceid = Hive.box("device_id").get('id');

class ApiEndpoint {
  static String registerApi = "$api/register";
  static String loginApi = "$api/login";
  static String forgetpassword = "$api/forgot-password";
  static String otpemail = "$api/forgot-otp-verify";
  static String resetpassword = "$api/reset-password";
  static String home = "$api/home";
  static String profile = "$api/profile";
  static String changepassword = "$api/change-password";
  static String vehiclebrands = "$api/vehicle-brands";
  static String vehiclelisting = "$api/vehicle-listing";
  static String vehicledetails = "$api/vehicle-details";
  static String profileImageUpdate = "$api/profile-image-update";
  static String profileEdit = "$api/profile-edit";
  static String buyNow = "$api/buy-now";
  static String placeBid = "$api/place-bid";
  static String bidhistory = "$api/bid-history";
  static String paymentDetails = "$api/payment-details";
  static String paymentdetailsStore = "$api/payment-store";
  static String sale = "$api/sell-car";
}
