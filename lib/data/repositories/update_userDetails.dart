import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/repositories/profileweb.dart';

updateProfileDetails(BuildContext context) async {
  final name = EditProfilecontoller.nameController.text;
  final mail = EditProfilecontoller.emailController.text;
  final apiToken = Hive.box("token").get('api_token');
  if (apiToken == null) return;
  if (name.isEmpty) {
    showAnimatedSnackBar(context, "Name is Required");
  } else if (mail.isEmpty) {
    showAnimatedSnackBar(context, "Mail is Required");
  } else {
    try {
      var response = await http.post(
          Uri.parse('${ApiEndpoint.profileEdit}?name=$name&email=$mail'),
          headers: {"device-id": 'abc', "api-token": apiToken});
      if (response.statusCode == 200) {
        // log(response.body);
        Navigator.of(context).pop();
        await postprofileData(context);

        return;
      } else {
        // print(response.statusCode);
        // print(response.body);
        // print('Something went wrong');
      }
    } on Exception catch (e) {
      log("Something Went Wrong17");
      print(e);
    }
  }
}
