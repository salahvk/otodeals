import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/presentation/screens/paymentpage.dart';

// import 'package:otodeals/data/providers/dataprovider.dart';
// import 'package:provider/provider.dart';
//import 'package:otodeals/data/models/customer_detail.dart';

Future postLoginData(BuildContext context) async {
  final email = Logincontroller.emailController.text;
  final password = Logincontroller.passwordController.text;

  String url = "${ApiEndpoint.loginApi}?email=$email&password=$password";
  String s = 'abc';
//  String? token;

//final loginProvider = Provider.of<DataProvider>(context,listen: false);

  print(url);

  try {
    print("aaaa");
    var response = await http.post(Uri.parse(url), headers: {"device-id": s});
    if (response.statusCode != 200) {
      //  showAnimatedSnackBar(context,"something went wrong");
      return response;
    }
    var jsonResponse = jsonDecode(response.body);
    log(response.body);

    //loginProvider.logdata(jsonResponse['api_token']);

    if (jsonResponse['result'] == false) {
      print("aaaaaaa///");
      if(jsonResponse['message'].toString().contains(' subscription package is expired')){
          showAnimatedSnackBar(context, "Your account subscription package is expired!!");
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Paymentpage()),
    );
      }else{
      print(jsonResponse['result']);
      showAnimatedSnackBar(context, "Invalid username&password");
      //  log(jsonResponse['result']);
      //  log(jsonResponse);
      print(jsonResponse);
      return jsonResponse;
      }
    } else {
      print("ssss");
      //   var customerdetails = CustomerDDetails.fromJson(jsonResponse);
      //  print(customerdetails.apiToken);
      // loginProvider.logdata(customerdetails);
      log(jsonResponse['customerdetails']['api_token'].toString());
      final apitoken = jsonResponse['customerdetails']['api_token'];

      final password = Logincontroller.passwordController.text;
      print(password);
      print(apitoken);
      Hive.box('token').put('api_token', apitoken ?? '');
      Hive.box('password').put('password', password);
      print(apitoken);
      // log(apitoken??'');
      print(Hive.box('token').toMap());
      print(Hive.box('password').toMap());
    }

    return jsonResponse;
  } on Exception catch (e) {
    print(e);
  }
}
