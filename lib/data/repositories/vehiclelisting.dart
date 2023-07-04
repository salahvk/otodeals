import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future<void> fetchSearchResults(BuildContext context) async {
  String s='abc';
      final type=Searchcontroller.vehicletypecontroller.text;
      final gearshift=Searchcontroller.gearshiftcontroller.text;
      final fueltype=Searchcontroller.fueltypecontroller.text;
      final minprice=Searchcontroller.minpricecontroller.text;
      final maxprice=Searchcontroller.maxpricecontroller.text;
      final modelyearrange1=Searchcontroller.yearrange1controller.text;
        final modelyearrange2=Searchcontroller.yearrange2controller.text;
      // final brand=Searchcontroller.vehiclebrandcontroller.text;
      final searchdata=Searchcontroller.searchdatacontroller.text;
    
      final url="${ApiEndpoint.vehiclelisting}?type=$type&searchdata=$searchdata$gearshift$fueltype&min=$minprice&max=$maxprice&modelyear['range1']=$modelyearrange1&modelyear['range2']=$modelyearrange2";
    // final url = "${ApiEndpoint.vehiclelisting}?type=$type&filter_brand[]=$brand&filter_fueltype[]=$fueltype&filter_gearshift[]=$gearshift&min=$minprice&max=$maxprice&modelyear['range1']=$modelyearrange1&modelyear['range2']=$modelyearrange2&searchdata=$searchdata]"; // Replace with your actual web service URL
final provider=Provider.of<Vehicleprovider>(context,listen:false);
print(url);
    final response = await http.post(
      Uri.parse(url),headers:{'device-id':s} ,
  
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data=VehicleListing.fromJson(jsonData);
      provider.vlistdata(data);
      // print(jsonData);
      // print(data);

      // final List<VehicleListing> results = [];
      //  results.addAll(results);
       print(data);
    

      // for (var item in jsonData) {
      //   final vehicle = VehicleListing(
      //     type:item['type'],
      //     price:item['price'],
      //     gearshift:item['gearshift'],
      //     fueltype:item['fueltype'],
      //     modelyear:item['modelyear'],
      //   );
      //   results.add(vehicle);
       
      // }
    }
    
 
   

    }
  