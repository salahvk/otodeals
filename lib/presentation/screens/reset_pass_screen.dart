import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/repositories/resetpassword.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {





  void reset(){
    final newpassword=Resetpassword.newpasswordController.text;
    final confirmpassword=Resetpassword.confirmpasswordController.text;

    if (newpassword.isEmpty ||confirmpassword.isEmpty) {
    showAnimatedSnackBar(context,'please enter your new password');
    // Password or confirm password is empty
  } else if (newpassword.length < 6) {
    showAnimatedSnackBar(context,"password must contain atleast 6 characters");
    // Password length is less than 6 characters
  } else if (newpassword !=confirmpassword) {
    showAnimatedSnackBar(context,"your confirmed password mismatched");
  }
  else{
     postResetpasswordData(context);
  Navigator.of(context).pushNamed(Routes.loginScreen);
  showAnimatedSnackBar(context,"Password changed!",type: AnimatedSnackBarType.success);
 
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
                  child: TextFormField(
                    controller: Resetpassword.newpasswordController,
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
               SizedBox(
                  height: 25,
                  child: TextField(
                    controller: Resetpassword.confirmpasswordController,
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
              InkWell(
                onTap: () {
                  reset();
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
                        "Reset Password",
                        style: getMediumtStyle(
                            color: Colormanager.white, fontSize: 16),
                      ),
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
