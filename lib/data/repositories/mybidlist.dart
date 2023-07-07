import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/mybidlistmodel.dart.dart';

import 'package:otodeals/data/providers/bidprovider.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future getbidhistorydetails(BuildContext context) async {
  String url = ApiEndpoint.bidhistory;
  String s = 'abc';
   String? token;
    token = Hive.box('token').get('api_token');
  print(token);
  Bidhistory? biddata;
  try {
    print(url);
    print("enteredddddd");
    final provider =
        Provider.of<Bidprovider>(context, listen: false);

    var response = await http.post(Uri.parse(url), headers: {
      "device-id": s,
      "api-token": token ?? ''
      });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      final biddata = Bidhistory.fromJson(jsonResponse);
      provider.bidlist(biddata);
      print(jsonResponse);

      return jsonResponse;
    } else {
      //  showAnimatedSnackBar(context,"something went wrong");
    }
  } on Exception catch (e) {
    print(e);
  }
  return biddata;
}