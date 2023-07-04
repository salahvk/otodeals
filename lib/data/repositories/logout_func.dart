import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';

logout(BuildContext context) async {
  final name = EditProfilecontoller.nameController.text;
  final mail = EditProfilecontoller.emailController.text;
  Hive.box("token").delete('api_token');
  Navigator.pushNamedAndRemoveUntil(
      context, Routes.welcomeScreen, (route) => false);
  //  try {
  //     var response = await http.post(
  //         Uri.parse('${ApiEndpoint.profileEdit}?name=$name&email=$mail'),
  //         headers: {"device-id": 'abc', "api-token": apiToken});
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       Navigator.of(context).pop();
  //       await postprofileData(context);

  //       return;
  //     } else {
  //       // print(response.statusCode);
  //       // print(response.body);
  //       // print('Something went wrong');
  //     }
  //   } on Exception catch (e) {
  //     log("Something Went Wrong17");
  //     print(e);
  //   }
}
