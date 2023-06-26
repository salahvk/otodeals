import 'package:flutter/material.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';

class Vehicleprovider with ChangeNotifier{
  VehicleListing? vlist;
void vlistdata(value){
  vlist=value;
  notifyListeners();
}
VehicleListing? serchedvehicles;
void searchdata(value){
  serchedvehicles=value;
  notifyListeners();
}



}