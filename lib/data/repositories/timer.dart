import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/home.dart';

class ApiService {
  static Future<HomeWithTimer> fetchDataFromApi(int index) async {
    String s='abc';
    try {
      String url = ApiEndpoint.home;

      final response = await http.get(Uri.parse(url),headers:{"device-id":s} );
      if (response.statusCode == 200) {
        Home data = jsonDecode(response.body);
        final startDateTimeString =
            data.bidVehicles![index].starttime.toString();
        final endDateTimeString = data.bidVehicles![index].endtime.toString();
        DateTime startDate = DateTime.parse(startDateTimeString);
        DateTime endDate = DateTime.parse(endDateTimeString);
        Duration remainingTime = endDate.difference(DateTime.now());
        print(startDate);
        print(endDate);
        print("aaaaaaaaa");
        return HomeWithTimer(data, remainingTime);
      } else {
        throw Exception('Failed to fetch data from API');
      }
    } catch (error) {
      throw Exception('Failed to fetch data from API: $error');
    }
  }
}

class HomeWithTimer {
  final Home data;
  final Duration remainingTime;

  HomeWithTimer(this.data, this.remainingTime);
}
