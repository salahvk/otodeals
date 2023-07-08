import 'package:flutter/material.dart';
import 'package:otodeals/data/models/customer_detail.dart';


import 'package:otodeals/data/models/home.dart';
import 'package:otodeals/data/models/payment_model.dart';
import 'package:otodeals/data/models/profilemodel.dart';
import 'package:otodeals/data/models/vehiclebrands.dart';


class DataProvider with ChangeNotifier{
String? deviceId;
int?id;


Home? homemodel;
void homemodeldata(value){
  homemodel=value;
  notifyListeners();
}
void cleardata(){
 homemodel=null; 
}
CustomerDDetails? loggin;
void logdata(value){
  loggin=value;
  notifyListeners();
}
 
 Profilemodel? profiles;
void profiledata(value){
  profiles=value;
  notifyListeners();
}
VehicleBrands? vbrands;
void vbranddata(value){
  vbrands=value;
  notifyListeners();
}
PaymentDetailsModel? paydata;
void paydetail(value){
  paydata=value;
  notifyListeners();
}




}