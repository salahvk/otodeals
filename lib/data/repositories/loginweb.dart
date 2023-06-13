import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;



final email=Logincontroller.emailController.text;
final password=Logincontroller.passwordController.text;
String url="${ApiEndpoint.loginApi}?email=$email&password=$password";
String s='abc';

 Future  postLoginData(BuildContext context)async{
  print(url);
try{
  var response=await http.post(Uri.parse(url),headers:{"device-id":s});
  if(response.statusCode!=200){
     showAnimatedSnackBar(context,"something went wrong");
      return response;
  }
   var jsonResponse=jsonDecode(response.body);
    print(jsonResponse);
    if(jsonResponse['result']==false){
       showAnimatedSnackBar(context,"Invalid username&password");
      return jsonResponse;

    }
    return jsonResponse;
  
   

}on Exception catch(e){
  print(e);
}
  

}