import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/presentation/widgets/terms_and_condition.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                height: size.height * .6,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .1,
                    ),
                    SizedBox(
                        width: size.width * .6,
                        child: Image.asset(AssetImages.logo)),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Text(
                      "LOG IN",
                      style: getMediumtStyle(
                          color: Colormanager.textColor, fontSize: 16),
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    Row(
                      children: const [
                        Text("Email :"),
                      ],
                    ),
                    SizedBox(
                        height: 30,
                        child: TextField(
                          style: getRegularStyle(
                              color: Colormanager.greyText, fontSize: 16),
                        )),
                    SizedBox(
                      height: size.height * .015,
                    ),
                    Row(
                      children: const [
                        Text("Password :"),
                      ],
                    ),
                    const SizedBox(
                        height: 30,
                        child: TextField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          style: TextStyle(
                              color: Colormanager.greyText, fontSize: 16),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create an account?",
                          style: getMediumtStyle(color: Colormanager.greyText),
                        ),
                        Text(
                          "Register",
                          style: getMediumtStyle(color: Colormanager.primary),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const TermsAndCondition(),
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
                            "LOG IN",
                            style: getMediumtStyle(
                                color: Colormanager.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width * .8, height: 40,
                      decoration: BoxDecoration(
                          color: Colormanager.grey,
                          borderRadius: BorderRadius.circular(12)),
                      // height: 40,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * .15,
                              ),
                              Image.asset(
                                AssetImages.google,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Continue With Google",
                                style: getMediumtStyle(
                                    color: Colormanager.greyText, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width * .8,
                      decoration: BoxDecoration(
                          color: Colormanager.blue,
                          borderRadius: BorderRadius.circular(12)),
                      // height: 40,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * .15,
                              ),
                              CircleAvatar(
                                maxRadius: 10,
                                backgroundColor: Colormanager.white,
                                child: Image.asset(
                                  AssetImages.fb,
                                  // width: 25,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Continue With Facebook",
                                style: getMediumtStyle(
                                    color: Colormanager.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forget Password?",
                      style: getMediumtStyle(color: Colormanager.greyText),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
