import 'package:hive/hive.dart';
String endpoint="http://192.168.29.44:8010";
String api="$endpoint/api";
String deviceid=Hive.box("device_id").get('id');

class ApiEndpoint{
  static String registerApi="$api/customer/register";
  static String loginApi="$api/customer/login";
  static String forgetpassword="$api/customer/forgot-password";
  static String otpemail="$api/customer/forgot-otp-verify";
  static String resetpassword="$api/customer/reset-password";
}