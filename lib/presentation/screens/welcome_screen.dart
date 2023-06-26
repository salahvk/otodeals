import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

// import 'package:otodeals/presentation/initplatform.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
//  void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      // initPlatformState(context);
//     });
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.welcomeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(AssetImages.logo),
                      SizedBox(
                        height: size.height * .06,
                      ),
                      Text(
                        "BEST",
                        style: getSemiBoldStyle(
                            color: Colormanager.white, fontSize: 24),
                      ),
                      Text(
                        "CAR SELLING & BUYING",
                        style: getSemiBoldStyle(
                            color: Colormanager.primary, fontSize: 24),
                      ),
                      Text(
                        "PLATFORM",
                        style: getSemiBoldStyle(
                            color: Colormanager.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                  onPressed: () {
                  Navigator.pushNamed(context,Routes.landingScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    primary:Colormanager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Explore Now',
                      style: TextStyle(
                        color: Colormanager.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                    SizedBox(
                      height: size.height * .08,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
 }
}
// void checkTokenAndNavigate(BuildContext context)async {
//   final token = Hive.box('token').get('api_token');
//   print(token);
//   print("aaaa");
//   if (token == null) {
//     // Token is null, navigate to the login page
//     Navigator.of(context).pushNamed(Routes.welcomeScreen);
//   } else {
//     // Token exists, navigate to the home page
//     await gethome(context);
//     Navigator.of(context).pushNamed(Routes.mainScreen);
//   }
 