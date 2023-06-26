

import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:otodeals/data/models/vehiclelisting.dart';



import 'dart:convert';
class VehiclelistingService{
 static  Future<VehicleListing>searchvehlistingData({String? type,String? fueltype,String? gearshift,int?price,int?modelyear,String? search})async{
  // final vehtype=Searchcontroller.vehicletypecontroller.text;
  String url="${ApiEndpoint.vehiclelisting}";
  final Map<String,dynamic>requestbody={
    'type':type,
    'fueltype':fueltype,
    'gearshift':gearshift,
    'price':price,
    'modelyear':modelyear,
    'searchdata':search,

  };
String s="abc";

 
  try{
    var response=await http.post(Uri.parse(url),headers:{"device-id":s},body:requestbody );
     if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
     

      final vlistdatas=VehicleListing.fromJson(jsonResponse);
      return vlistdatas;
    

     }else{
       throw Exception('Failed to search vehicles. Status code: ${response.statusCode}');
     }
    

  } catch(e){
    
throw Exception('failed to search vehicle.Error:$e');
  }
}
}

// Searchvehicles(BuildContext context,String type)async{
//    final type=Searchcontroller.vehicletypecontroller.text;
// final fueltype=Searchcontroller.fueltypecontroller.text;
// final gearshift=Searchcontroller.gearshiftcontroller.text;
// final price=Searchcontroller.pricecontroller.text;
// final brand=Searchcontroller.vehiclebrandcontroller.text;
// final modelyear =Searchcontroller.modelyearcontroller.text;
// final searchdata=Searchcontroller.vehiclebrandcontroller.text;

//   String s="abc";
//   final vehicleprovider=Provider.of<Vehicleprovider>(context,listen: false);
//   final vehicledetails=vehicleprovider.vlist?.products;
//   try{
//     final url="${ApiEndpoint.vehiclelisting}?type=";
//     print(url);
//     var response=await http.post(Uri.parse(url),headers: {"device-id":s});
//     if(response.statusCode==200){

//       var jsonResponse=jsonDecode(response.body);
//       final vlistdatas=VehicleListing.fromJson(jsonResponse);
//       vehicleprovider.vlistdata(vlistdatas);
//       if (vehicleprovider.vlist?.products?.data?.isEmpty?? false) {
//         showAnimatedSnackBar(context, "No ServiceMan Available");
//       }
//     }


//   }on Exception catch(_){
//      showAnimatedSnackBar(context,"something went wrong");

//   }
// }