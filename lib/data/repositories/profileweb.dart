import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/data/models/profilemodel.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:provider/provider.dart';

Future postprofileData(BuildContext context) async {
  String url = ApiEndpoint.profile;
  String s = 'abc';
  String? token;
  Profilemodel? profiledatas;
  token = Hive.box('token').get('api_token');
  print(token);
  print(url);

  try {
    print(url);
    final profileprovider = Provider.of<DataProvider>(context, listen: false);

    var response = await http.post(Uri.parse(url), headers: {
      "device-id": s,
      "api-token": token ?? '',
    });

    if (response.statusCode != 200) {
      // showAnimatedSnackBar(context,"something went wrong");
      return;
    }
    var jsonResponse = jsonDecode(response.body);
    final profiledatas = Profilemodel.fromJson(jsonResponse);
    profileprovider.profiledata(profiledatas);
    print(jsonResponse);
    return jsonResponse;

    // Regmodel ws=Regmodel.fromJson(jsonResponse);
  } on Exception catch (e) {
    print(e);
  }
  return profiledatas;
}
