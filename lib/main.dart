import 'package:flutter/material.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/presentation/screens/welcome_screen.dart';




//import 'package:otodeals/core/routes_manager.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otodeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.welcomeScreen,
      onGenerateRoute: RouteGenerator.getRoute,
      home: WelcomeScreen()
    );
  }
}
