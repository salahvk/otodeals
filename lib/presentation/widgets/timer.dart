import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/home.dart';

import 'package:otodeals/data/repositories/homeweb.dart';

import 'package:http/http.dart' as http;

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late DateTime startDate;
  late DateTime endDate;
   Duration? remainingTime;
  late Timer timer;
 

  @override
  void initState() {
  
   
    gethome(context);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  
  Future<void> fetchDataFromApi(int index) async {
    try {
      String url="${ApiEndpoint.home}";
     
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Home data = jsonDecode(response.body);
        final startDateTimeString =data.bidVehicles![index].starttime.toString();                         // Replace with actual key for start date
        final endDateTimeString = data.bidVehicles![index].endtime.toString(); // Replace with actual key for end date
        startDate = DateTime.parse(startDateTimeString);
        endDate = DateTime.parse(endDateTimeString);
        remainingTime = endDate.difference(DateTime.now());
        timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
          setState(() {
            remainingTime = endDate.difference(DateTime.now());
          });
        });
      } else {
       
      }
    } catch (error) {
 
    }
  }

  @override
  Widget build(BuildContext context) {


    int days = remainingTime!.inDays;
    int hours = remainingTime!.inHours.remainder(24);
    int minutes = remainingTime!.inMinutes.remainder(60);
    int seconds = remainingTime!.inSeconds.remainder(60);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 236, 236),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: buildTime(days, hours, minutes, seconds),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    timer.cancel();
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  Widget buildTime(int days, int hours, int minutes, int seconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final daysStr = hours >= 24 ? '$days Days ' : '';
    final hoursStr = twoDigits(hours%24);
    final minutesStr = twoDigits(minutes);
    final secondsStr = twoDigits(seconds);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         if  (hours >= 24)
         Column(
           children: [
             buildTimeCard(time:daysStr, header: 'DAYS'),
           ],
         ),
        
        buildTimeCard(time: hoursStr, header: 'HOURS'),
        SizedBox(width: 6),
        buildTimeCard(time: minutesStr, header: 'MINUTES'),
        SizedBox(width: 6),
        buildTimeCard(time: secondsStr, header: 'SECONDS'),
         
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 236, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        Text(
          header,
          style: TextStyle(
            color: Colormanager.primary,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
