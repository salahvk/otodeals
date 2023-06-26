import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/repositories/homeweb.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * .25,
                      ),
                      Text("Dreams",
                          style: getBoldStyle(
                                  color: Colormanager.primary, fontSize: 56)
                              .copyWith(
                            fontFamily: 'Karben 105',
                          )),
                      SizedBox(
                        width: size.width * .04,
                      ),
                      Image.asset('assets/slide_layer.png')
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 SizedBox(
                  width: size.width*.8,
                  child: ElevatedButton(
                    onPressed: () {
                      gethome(context);
                    Navigator.pushNamed(context,Routes.mainScreen);
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
                        'EXPLORE',
                        style: getSemiBoldStyle(
                          color: Colormanager.white,
                          fontSize: 16,
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: size.width*.8,
                  child: ElevatedButton(
                  onPressed: () {
                                Navigator.pushNamed(context,Routes.loginScreen);
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
                      'LOG IN',
                      style: TextStyle(
                        color: Colormanager.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width*.8,
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.pushNamed(context,Routes.registerScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      primary:Colormanager.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'CREATE AN ACCOUNT',
                        style: getMediumtStyle(
                          color: const Color.fromARGB(245, 0, 0, 0),
                          fontSize: 16,
                        )
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
