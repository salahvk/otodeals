import 'dart:convert';
import 'dart:developer';


import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';

import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

import 'package:provider/provider.dart';

import '../providers/pathprovider.dart';

getpaystore(BuildContext context) async {
  final email = Logincontroller.emailController.text;
  final payamount=PaystoreController.paymentamount.text;
final provider = Provider.of<FilePathProvider>(context,listen: false);

var uri =Uri.parse('${ApiEndpoint.paymentdetailsStore}?email=$email&payment_amount=$payamount');
String s = 'abc';
  print(uri);
  print(provider.filePath);
  try {
  
      var request = http.MultipartRequest(
        "POST",
        uri,
      );

      print(uri);

      // List<MultipartFile> multiPart = [];

      var stream =
          http.ByteStream(DelegatingStream(provider.filePath!.openRead()));
      var length = await provider.filePath!.length();
      // final apiToken = Hive.box("token").get('api_token');

      request.headers.addAll(
          {"device-id":s});
      var multipartFile = http.MultipartFile(
        'payment_image',
        stream,
        length,
        filename: (provider.filePath!.path),
      );

      request.files.add(multipartFile);

      // "content-type": "multipart/form-data"

      var res = await request.send();
      final response = await http.Response.fromStream(res);
       
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        log(response.body);
        print(jsonResponse);
        
        
        showAnimatedSnackBar(context,"Payment Details Stored Successfully.",type:AnimatedSnackBarType.success);
       
      } else {
          if(provider.filePath!.path.isEmpty){
                    showAnimatedSnackBar(context,"Please Upload Pay Slip");
                   }
                   

        log(
          "// Went Wrong2",
        );
      }
    } on Exception catch (_) {}
  }
