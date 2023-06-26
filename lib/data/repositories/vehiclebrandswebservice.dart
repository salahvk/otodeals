

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/api/api_endpoint.dart';

import 'package:otodeals/data/models/vehiclebrands.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

String url="${ApiEndpoint.vehiclebrands}";
String s='abc';
VehicleBrands? branddata;
Future getvehiclebrands(BuildContext context)async{
  try{
  print(url);
  log("aaaaaaaaaa");
final brandsprovider=Provider.of<DataProvider>(context,listen:false);

var response=await http.post(Uri.parse(url),headers: {"device-id":s});

if(response.statusCode==200){
  var jsonResponse=jsonDecode(response.body);

  final branddata=VehicleBrands.fromJson(jsonResponse);
  brandsprovider.vbranddata(branddata) ;
    print(jsonResponse);
    return jsonResponse;
  
}else{
   showAnimatedSnackBar(context,"something went wrong");
     ;

   
}



}on Exception catch(e){
  print(e);
}
return branddata;
}