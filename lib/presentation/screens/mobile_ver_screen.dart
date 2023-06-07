import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class MobileVerScreen extends StatelessWidget {
  const MobileVerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colormanager.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .1,
            ),
            SizedBox(
                width: size.width * .6,
                child: Image.asset(AssetImages.logoBlack)),
            SizedBox(
              height: size.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Log In With Mobile Number",
                  style: getMediumtStyle(
                      color: Colormanager.textColor, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Row(
              children: [
                // const Icon(Icons.email),
                // const SizedBox(
                //   width: 10,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Phone Number:",
                      style: getMediumtStyle(
                          color: Colormanager.textColor, fontSize: 14),
                    ),
                    SizedBox(
                        height: 25,
                        width: size.width * .7,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: getRegularStyle(
                              color: Colormanager.greyText, fontSize: 16),
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * .05,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'We will send you an ',
                style: getMediumtStyle(
                    color: Colormanager.textColor, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: 'OTP ',
                    style: getMediumtStyle(
                        color: Colormanager.primary, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'for verify your \nmobile number.',
                    style: getMediumtStyle(
                        color: Colormanager.textColor, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.otpScreen);
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
                      "CONTINUE",
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
            Text(
              "Trouble Signing in?",
              style: getMediumtStyle(color: Colormanager.primary),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Text(
                "By continuing, you agree to Terms & Conditions",
                style: getMediumtStyle(color: Colormanager.greyText),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
