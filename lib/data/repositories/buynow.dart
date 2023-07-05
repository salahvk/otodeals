import 'dart:convert';
import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/vehicledetails.dart';
import 'package:provider/provider.dart';

Future<bool> buyNow(BuildContext context) async {
  final vres = Provider.of<Vehicledetailsprovider>(context, listen: false);

  final apiToken = Hive.box("token").get('api_token');
  final name = ProductController.nameController.text;
  final phone = ProductController.phoneNoController.text;
  final mail = ProductController.mailController.text;
  final address = ProductController.addressController.text;
  final city = ProductController.cityController.text;
  final location = ProductController.locationController.text;
  final product = vres.vehdet?.vehicle?.id;
  if (apiToken == null) return false;

  try {
    final url =
        '${ApiEndpoint.buyNow}?product_id=$product&name=$name&email=$mail&phone_number=$phone&address=$address&city=$city&location=$location';
    print(url);
    var response = await http.post(Uri.parse(url),
        headers: {"device-id": 'abc', "api-token": apiToken});
    if (response.statusCode == 200) {
      log(response.body);
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['result'] != false) {
        showAnimatedSnackBar(context, jsonResponse['message'],
            type: AnimatedSnackBarType.success);
        return true;
      } else {
        showAnimatedSnackBar(
          context,
          jsonResponse['message'],
        );
      }

      // Navigator.of(context).pop();

      return false;
    } else {
      // print(response.statusCode);
      // print(response.body);
      // print('Something went wrong');
    }
  } on Exception catch (e) {
    log("Something Went Wrong17");
    print(e);
  }
  return false;
}
