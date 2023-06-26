import 'package:hive/hive.dart';
String endpoint="http://192.168.29.44:8010";
// String endpoint="https://projects.techoriz.in/ottodeals/public";
String api="$endpoint/api";
String deviceid=Hive.box("device_id").get('id');

class ApiEndpoint{
  static String registerApi="$api/customer/register";
  static String loginApi="$api/customer/login";
  static String forgetpassword="$api/customer/forgot-password";
  static String otpemail="$api/customer/forgot-otp-verify";
  static String resetpassword="$api/customer/reset-password";
  static String home="$api/customer/home";
  static String profile="$api/customer/profile";
  static String changepassword="$api/customer/change-password";
  static String vehiclebrands="$api/customer/vehicle-brands";
  static String vehiclelisting="$api/customer/vehicle-listing";
  static String vehicledetails="$api/customer/vehicle-details";
}