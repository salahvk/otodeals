import 'package:flutter/material.dart';
import 'package:otodeals/data/models/mybidlistmodel.dart.dart';

class Bidprovider with ChangeNotifier{
Bidhistory? bidvar; 
void bidlist(value){
  bidvar=value;
  notifyListeners();

} 

}