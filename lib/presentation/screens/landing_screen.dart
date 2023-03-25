import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * .5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Drive Your",
                    style: getBoldStyle(color: Colors.black, fontSize: 56)
                        .copyWith(
                      fontFamily: 'Karben 105',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("Dreams",
                      style: getBoldStyle(
                              color: Colormanager.primary, fontSize: 56)
                          .copyWith(
                        fontFamily: 'Karben 105',
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                  child: Container(
                    width: size.width * .8,
                    decoration: BoxDecoration(
                        color: Colormanager.primary,
                        borderRadius: BorderRadius.circular(12)),
                    // height: 40,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "LOG IN",
                          style: getMediumtStyle(
                              color: Colormanager.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.registerScreen);
                  },
                  child: Container(
                    width: size.width * .8,
                    decoration: BoxDecoration(
                        color: Colormanager.grey,
                        borderRadius: BorderRadius.circular(12)),
                    // height: 40,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "CREATE AN ACCOUNT",
                          style: getMediumtStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
