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

placeBid(BuildContext context) async {
  final vres = Provider.of<Vehicledetailsprovider>(context, listen: false);

  final apiToken = Hive.box("token").get('api_token');
  final bidAmount = ProductController.bidController.text;
  if (apiToken == null) return;

  try {
    final url =
        '${ApiEndpoint.placeBid}?product_id=${vres.vehdet?.vehicle?.id.toString()}&bid_amount=$bidAmount';
    print(url);
    var response = await http.post(Uri.parse(url),
        headers: {"device-id": 'abc', "api-token": apiToken});
    if (response.statusCode == 200) {
      log(response.body);
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['result'] != false) {
        showAnimatedSnackBar(context, "Bid Placed",
            type: AnimatedSnackBarType.success);
      } else {
        showAnimatedSnackBar(
          context,
          jsonResponse['message'],
        );
      }

      // Navigator.of(context).pop();

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
