import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehicledetails.dart';
import 'package:otodeals/data/providers/vehicledetails.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future getvehicledetails(BuildContext context,int id)async{
  
String url="${ApiEndpoint.vehicledetails}?product_id=$id";
String s='abc';
Vehicledetails? data;
  try{
  print(url);
final provider=Provider.of<Vehicledetailsprovider>(context,listen:false);

var response=await http.post(Uri.parse(url),headers: {"device-id":s});

if(response.statusCode==200){
  var jsonResponse=jsonDecode(response.body);

  final data=Vehicledetails.fromJson(jsonResponse);
  provider.vehiceldetaildata(data) ;
    print(jsonResponse);

    return jsonResponse;
    
  
}else{
   showAnimatedSnackBar(context,"something went wrong");
     ;

   
}



}on Exception catch(e){
  print(e);
}
return data;
}