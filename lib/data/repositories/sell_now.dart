import 'dart:convert';
import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';

Future<bool> sellNow(BuildContext context) async {
  final apiToken = Hive.box("token").get('api_token');
  final name = SaleController.nameController.text;
  final phone = SaleController.phoneController.text;
  final mail = SaleController.mailController.text;
  final address = SaleController.addressController.text;
  final city = SaleController.cityController.text;
  final location = SaleController.locationController.text;
  final model = SaleController.modelController.text;
  final type = SaleController.vehicleType.text;
  final price = SaleController.sellingPrice.text;
  final condition = SaleController.vehicleCondition.text;
  final regUpto = SaleController.registrationupto.text;
  final insurance = SaleController.insuranceupto.text;
  final accident = SaleController.accident.text;
  final tyre = SaleController.tyre.text;
  final ac = SaleController.ac.text;
  final engine = SaleController.engine.text;
  final exterior = SaleController.exterior.text;
  final interior = SaleController.interior.text;

  final vehicleverient = SaleController.vehicleverient.text;
  final kilometerupto = SaleController.kilometerupto.text;

  if (apiToken == null) return false;

  try {
    final url =
        '${ApiEndpoint.sale}?name=$name&phone=$phone&email=$mail&address=$address&city=$city&location=$location&vehicle_type=$type&model=$model&selling_price=$price&vehicle_condition=$condition&registrationupto=$regUpto&insuranceupto=$insurance&vehicle_verient=$vehicleverient&kilometerupto=$kilometerupto&interior=$interior&exterior$exterior&engine=$engine&tyre=$tyre&ac=$ac&accident=$accident';
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
