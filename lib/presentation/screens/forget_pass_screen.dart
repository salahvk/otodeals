import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/repositories/forget_password.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  void input(){
    final email=Forgetpasswordcontroller.emailController.text;
     final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');   
     if(email.isEmpty){
      showAnimatedSnackBar(context,"please enter your email");
    }else if(!emailRegex.hasMatch(email)){
      showAnimatedSnackBar(context,"invalid email");
      }
      else{
  Navigator.of(context).pushNamed(Routes.mailotpScreen);
  postForgetpasswordData(context);
  }
      
      }
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
                height: size.height * .1,
              ),
              SizedBox(
                  width: size.width * .6,
                  child: Image.asset(AssetImages.logoBlack)),
              SizedBox(
                height: size.height * .05,
              ),
              Text(
                "FORGOT PASSWORD",
                style: getMediumtStyle(
                    color: Colormanager.textColor, fontSize: 20),
              ),
              SizedBox(
                height: size.height * .08,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.email),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Registered Email Id:",
                        style: getMediumtStyle(
                            color: Colormanager.black, fontSize: 14),
                      ),
                    
                      SizedBox(
                          height:45,
                          width: size.width * .7,
                          child: TextFormField(
                            controller: Forgetpasswordcontroller.emailController,
                            style: getRegularStyle(
                                color: Colormanager.greyText, fontSize: 16),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .015,
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  input();
                },
                child: Container(
                  width: size.width * .8,
                  decoration: BoxDecoration(
                      color: Colormanager.primary,
                      borderRadius: BorderRadius.circular(14)),
                  // height: 40,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "SEND OTP",
                        style: getMediumtStyle(
                            color: Colormanager.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Don't have an account?",
                    style: getMediumtStyle(
                        color: Colormanager.greyText, fontSize: 14),
                  ),
                  InkWell(
                    child: Text(
                      "Create One",
                      style: getMediumtStyle(
                          color: Colormanager.primary, fontSize: 14),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.registerScreen);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
