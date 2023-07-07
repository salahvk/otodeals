import 'package:flutter/material.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/data/providers/bidprovider.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/providers/otp_provider.dart';
import 'package:otodeals/data/providers/vehicledetails.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';

import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';

//import 'package:otodeals/core/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("token");
  await Hive.openBox("password");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = Hive.box('token').get('api_token');
    final initialRoutes =
        token != null ? Routes.mainScreen : Routes.welcomeScreen;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => OTPProvider()),
          ChangeNotifierProvider(create: (_) => DataProvider()),
          ChangeNotifierProvider(create: (_) => Vehicleprovider()),
          ChangeNotifierProvider(create: (_) => Vehicledetailsprovider()),
          ChangeNotifierProvider(create: (_) => Bidprovider()),
        ],
        child: MaterialApp(
          title: 'Otodeals',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: initialRoutes,
          onGenerateRoute: RouteGenerator.getRoute,
          // home: TestScreen()
        ));
  }
}
