import 'package:flutter/material.dart';
import 'package:otodeals/data/models/vehicledetails.dart';

class Vehicledetailsprovider with ChangeNotifier{
  int?id;
 Vehicledetails? vehdet;
 void vehiceldetaildata(value){
  vehdet=value;
  notifyListeners();
 }

}