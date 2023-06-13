
 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;

final email=Forgetpasswordcontroller.emailController.text;
String url = "${ApiEndpoint.forgetpassword}?email=$email";
String s='abc';

postForgetpasswordData(BuildContext context)
async {
 print(url);
  

  try{
    

    // var response=await http.post(Uri.parse(url),headers:{"device-id":s});
    var response=await http.post(Uri.parse("http://192.168.29.44:8010/api/customer/register?name=Nikhil 2&email=nikhil2@gmail.com&password=123456&confirm_password=123456"),headers:{"device-id":s});

    if(response.statusCode!=200){
      showAnimatedSnackBar(context,"something went wrong");
      return;

    }
    var jsonResponse=jsonDecode(response.body);
    print(jsonResponse);
    // Regmodel ws=Regmodel.fromJson(jsonResponse);
    
  

  }on Exception catch(e){
    print("aaaa");
    print(e);
  }
}