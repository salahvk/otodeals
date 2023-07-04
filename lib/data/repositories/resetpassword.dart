import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;

final newpassword = Resetpassword.newpasswordController.text;
final confirmpassword = Resetpassword.confirmpasswordController.text;
String url =
    "${ApiEndpoint.resetpassword}?newpassword=$newpassword&confirmpassword=$confirmpassword";
String s = 'abc';
String? token;

postResetpasswordData(BuildContext context) async {
  token = Hive.box('token').get('api_token');
  print(token);
  print(url);

  try {
    var response = await http.post(Uri.parse(url), headers: {
      "device-id": s,
      "api-token": token ?? '',
    });

    if (response.statusCode != 200) {
      // showAnimatedSnackBar(context,"something went wrong");
      return;
    }
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    // Regmodel ws=Regmodel.fromJson(jsonResponse);
  } on Exception catch (e) {
    print(e);
  }
}
