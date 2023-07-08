import 'package:flutter/material.dart';
import 'package:otodeals/core/controllers.dart';
// import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:otodeals/presentation/screens/paymentpage.dart';
// import 'package:otodeals/data/viewmodel/registerviewmodel.dart';

Future postRegisterData(BuildContext context) async {
  final name = Registercontrollerr.namecontroller.text;
  final email = Registercontrollerr.emailController.text;
  final password = Registercontrollerr.passwordController.text;
  final confirmpassword = Registercontrollerr.confirmpasswordController.text;
  String url =
      "${ApiEndpoint.registerApi}?name=$name&email=$email&password=$password&confirm_password=$confirmpassword";
  print(url);
  try {
    var response = await http.post(Uri.parse(url));

    if (response.statusCode != 200) {
      // showAnimatedSnackBar(context,"something went wrong");
      return;
    } else {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      // Regmodel ws=Regmodel.fromJson(jsonResponse);
      if (jsonResponse['result'] == false) {
        showAnimatedSnackBar(context, "This email is already Registered!!");
        //  log(jsonResponse['result']);
        //  log(jsonResponse);
        print(jsonResponse);
        return jsonResponse;
      } else {
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Paymentpage()),
    );

        return jsonResponse;
      }
    }
  } on Exception catch (e) {
    print(e);
  }
}

// class WebService {
//   late  String name;
//   late String email;
//   late String password;
//   late String confirmpassword;

  
//   static  String url = "${ApiEndpoint.registerApi}"; // Replace with your API base URL

//   Future<RegViewModel> registerUser(String email, String password) async {
//     // Replace with your registration API endpoint

//     final requestBody = {
//       'email': email,
//       'password': password,
//     };

//     final response = await http.post(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return RegViewModel.fromJson(jsonData);
//     } else {
//       throw Exception('Registration failed with status code: ${response.statusCode}');
//     }
//   }
// }