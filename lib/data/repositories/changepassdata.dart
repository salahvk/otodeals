
 import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;



postChangepasswordData(BuildContext context)
async {
  final currentpassword=Changepasswordcontoller.currentpasswordController.text;
final newpassword=Changepasswordcontoller.newpasswordController.text;
final confirmpassword=Changepasswordcontoller.confirmpasswordController.text;
String url = "${ApiEndpoint.changepassword}?newpassword=$newpassword&confirmpassword=$confirmpassword&currentpassword=$currentpassword";
String s='abc';
 String? token;
 String? storedpassword;
   token=Hive.box('token').get('api_token');
   print(token);
 print(url);

storedpassword=Hive.box('password').get('password');
  

  try{
    

    var response=await http.post(Uri.parse(url),headers:{"device-id":s,"api-token":token??'',});

    if(response.statusCode!=200){
      showAnimatedSnackBar(context,"something went wrong");
      return;

    }
      var jsonResponse=jsonDecode(response.body);
    print(jsonResponse);
  
    if(storedpassword!=Changepasswordcontoller.currentpasswordController.text){
      showAnimatedSnackBar(context, "your current password is wrong");
    
    }else{
    
    showAnimatedSnackBar(context,"your password changed",type: AnimatedSnackBarType.success);
    // Regmodel ws=Regmodel.fromJson(jsonResponse);
    
    }
    return jsonResponse;

  }on Exception catch(e){
    
    print(e);
  }
}