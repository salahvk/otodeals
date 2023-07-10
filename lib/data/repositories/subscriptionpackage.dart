import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/payment_model.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future getsubscription(BuildContext context) async {
  String url = ApiEndpoint.paymentDetails;
  String s = 'abc';
PaymentDetailsModel? paymentdata;
  try {
    print(url);
    final paymentprovider = Provider.of<DataProvider>(context, listen: false);

    var response = await http.post(Uri.parse(url), headers: {"device-id": s});

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      paymentprovider.cleardata();

      final paymentdata = PaymentDetailsModel.fromJson(jsonResponse);

      paymentprovider.paydetail(paymentdata);
      

      print(jsonResponse);
      return jsonResponse;
    } else {
      //  showAnimatedSnackBar(context,"something went wrong");
    }
  } on Exception catch (e) {
    print(e);
  }
  return paymentdata;
}
