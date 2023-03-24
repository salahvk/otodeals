import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                        style: getSemiBoldtStyle(
                            color: Colormanager.white, fontSize: 24),
                      ),
                      Text(
                        "CAR SELLING & BUYING",
                        style: getSemiBoldtStyle(
                            color: Colormanager.primary, fontSize: 24),
                      ),
                      Text(
                        "PLATFORM",
                        style: getSemiBoldtStyle(
                            color: Colormanager.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colormanager.primary,
                          borderRadius: BorderRadius.circular(10)),
                      // height: 40,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Explore Now",
                            style: getMediumtStyle(
                                color: Colormanager.white, fontSize: 16),
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
