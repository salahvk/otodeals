
 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;

final newpassword=Resetpassword.newpasswordController.text;
final confirmpassword=Resetpassword.confirmpasswordController.text;
String url = "${ApiEndpoint.resetpassword}?newpassword=$newpassword&confirmpassword=$confirmpassword";
String s='abc';

postResetpasswordData(BuildContext context)
async {
 print(url);
  

  try{
    

    var response=await http.post(Uri.parse(url),headers:{"device-id":s});

    if(response.statusCode!=200){
      showAnimatedSnackBar(context,"something went wrong");
      return;

    }
    var jsonResponse=jsonDecode(response.body);
    print(jsonResponse);
    // Regmodel ws=Regmodel.fromJson(jsonResponse);
    
  

  }on Exception catch(e){
    
    print(e);
  }
}