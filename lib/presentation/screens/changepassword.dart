
import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
import 'package:otodeals/data/repositories/changepassdata.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  
  void reset(){
    final newpassword=Changepasswordcontoller.newpasswordController.text;
    final confirmpassword=Changepasswordcontoller.confirmpasswordController.text;
    final currentpassword=Changepasswordcontoller.currentpasswordController.text;

    if (newpassword.isEmpty ||confirmpassword.isEmpty) {
    showAnimatedSnackBar(context,'please enter your new password');
    // Password or confirm password is empty
  } else if (newpassword.length < 6) {
    showAnimatedSnackBar(context,"password must contain atleast 6 characters");
    // Password length is less than 6 characters
  } else if (newpassword !=confirmpassword) {
    showAnimatedSnackBar(context,"your confirmed password mismatched");
  }else if(currentpassword.isEmpty)
  {
    showAnimatedSnackBar(context,'please enter your current password');

  }else if (currentpassword.length < 6) {
    showAnimatedSnackBar(context,"password must contain atleast 6 characters");
    // Password length is less than 6 characters
  }
  // else if(currentpassword!=Registercontrollerr.passwordController){
  //   showAnimatedSnackBar(context,"your current password is wrong");
  // }
  else{
     postChangepasswordData(context);
  
 // showAnimatedSnackBar(context,"Password changed!",type: AnimatedSnackBarType.success);
 
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
                "Change PASSWORD",
                style: getMediumtStyle(
                    color: Colormanager.textColor, fontSize: 16),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Row(
                children: const [
                  Text("Current Password:"),
                ],
              ),
              SizedBox(
                  height: 25,
                  child: TextFormField(
                    controller: Changepasswordcontoller.currentpasswordController,
                    style: getRegularStyle(
                        color: Colormanager.greyText, fontSize: 16),
                  )),
              SizedBox(
                height: size.height * .015,
              ),
              Row(
                children: const [
                  Text("New Password :"),
                ],
              ),
               SizedBox(
                  height: 25,
                  child: TextField(
                    controller:Changepasswordcontoller.newpasswordController,
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
                    SizedBox(
                height: size.height * .015,
              ),
              Row(
                children: const [
                  Text("Confirm Password:"),
                ],
              ),
               SizedBox(
                  height: 25,
                  child: TextField(
                    controller: Changepasswordcontoller.confirmpasswordController,
                    obscureText: true,
                    
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
                  //reset();
                },
                child: InkWell(
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
                          "Change Password",
                          style: getMediumtStyle(
                              color: Colormanager.white, fontSize: 16),
                        ),
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