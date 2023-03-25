import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colormanager.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .08,
              ),
              SizedBox(
                  width: size.width * .6, child: Image.asset(AssetImages.logo)),
              SizedBox(
                height: size.height * .03,
              ),
              Text(
                "RESET PASSWORD",
                style: getMediumtStyle(
                    color: Colormanager.textColor, fontSize: 16),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Row(
                children: const [
                  Text("New Password:"),
                ],
              ),
              SizedBox(
                  height: 25,
                  child: TextField(
                    style: getRegularStyle(
                        color: Colormanager.greyText, fontSize: 16),
                  )),
              SizedBox(
                height: size.height * .015,
              ),
              Row(
                children: const [
                  Text("Confirm Password :"),
                ],
              ),
              const SizedBox(
                  height: 25,
                  child: TextField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    style:
                        TextStyle(color: Colormanager.greyText, fontSize: 16),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 45,
              ),
              Container(
                width: size.width * .8,
                decoration: BoxDecoration(
                    color: Colormanager.primary,
                    borderRadius: BorderRadius.circular(12)),
                // height: 40,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Reset Password",
                      style: getMediumtStyle(
                          color: Colormanager.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
