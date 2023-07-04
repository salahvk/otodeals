import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/home.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future gethome(BuildContext context) async {
  String url = ApiEndpoint.home;
  String s = 'abc';
  Home? homedata;
  try {
    print(url);
    final homeprovider = Provider.of<DataProvider>(context, listen: false);

    var response = await http.post(Uri.parse(url), headers: {"device-id": s});

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      homeprovider.cleardata();

      final homedata = Home.fromJson(jsonResponse);

      homeprovider.homemodeldata(homedata);

      print(jsonResponse);
      return jsonResponse;
    } else {
      //  showAnimatedSnackBar(context,"something went wrong");
    }
  } on Exception catch (e) {
    print(e);
  }
  return homedata;
}
