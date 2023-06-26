
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/core/util/animatedsnackbar.dart';
// import 'package:flutter_dialogs/flutter_dialogs.dart';


import 'package:otodeals/data/repositories/registerweb.dart';



class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
     bool _isChecked = false;
      bool passwordvisible=false;
       bool confirmpasswordvisible=false;

  // bool _isLoading = false;

  // void initState() {
  //   super.initState();
  //   Registercontrollerr.namecontroller.addListener(_validateInput);
  //   Registercontrollerr.emailController.addListener(_validateInput);
  //   Registercontrollerr.passwordController.addListener(_validateInput);
  //   Registercontrollerr.confirmpasswordController.addListener(_validateInput);
  // }

  void validateInput()async{
    print(_isChecked);
final name=Registercontrollerr.namecontroller.text;
final email=Registercontrollerr.emailController.text;
final password=Registercontrollerr.passwordController.text;
final confirmpassword=Registercontrollerr.confirmpasswordController.text;



    
 final nameRegex = RegExp(r'^[a-zA-Z]+$');
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');    
   if(name.isEmpty){
    showAnimatedSnackBar(context, "Please enter your name");
   }else if(!nameRegex.hasMatch(name)){
    showAnimatedSnackBar(context,"invalid Name");
   
   }
    else if(email.isEmpty){
      showAnimatedSnackBar(context,"please enter your email");
    }else if(!emailRegex.hasMatch(email)){
      showAnimatedSnackBar(context,"invalid email");
 
    }  
 else if (password.isEmpty ||confirmpassword.isEmpty) {
    showAnimatedSnackBar(context,'please enter password');
    // Password or confirm password is empty
  } else if (password.length < 6) {
    showAnimatedSnackBar(context,"password must contain atleast 6 characters");
    // Password length is less than 6 characters
  } else if (password !=confirmpassword) {
    showAnimatedSnackBar(context,"your confirmed password mismatched");
    // Password and confirm password do not match
  }else if(!_isChecked){
    showAnimatedSnackBar(context, "please accept the terms and conditions");
  }
  else{
   var res= await postRegisterData(context);
   if(res['result']!=false){
  Navigator.of(context).pushNamed(Routes.loginScreen);
  showAnimatedSnackBar(context,"You have successfully Registerd",type: AnimatedSnackBarType.success);
   }
  }
  }
   
  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color:Colormanager.white 
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Please accept the terms and conditions.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              
              onPressed: () {
                Navigator.of(context).pop();
              },
              
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
    //      setState(() {
    //   _isButtonDisabled = Registercontrollerr.namecontroller.text.isEmpty ||
    //   Registercontrollerr.emailController.text.isEmpty ||
    //       Registercontrollerr.passwordController.text.isEmpty ||Registercontrollerr.passwordController.length<6||
    //       Registercontrollerr.passwordController!=Registercontrollerr.confirmpasswordController||
    //       Registercontrollerr.confirmpasswordController.text.isEmpty ||
    //       !isnameValid ||!isemailValid ||
    //       !isPasswordValid ||!isconfirmPasswordValid;
    // });
  
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colormanager.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .1,
              ),
              SizedBox(
                  width: size.width * .6,
                  child: Image.asset(AssetImages.logoBlack)),
              SizedBox(
                height: size.height * .03,
              ),
              Text(
                "REGISTER ACCOUNT",
                style: getMediumtStyle(
                    color: Colormanager.textColor, fontSize: 16),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Row(
                children: const [
                  Text("Enter Name:"),
                ],
              ),
              SizedBox(
                  height: 25,
                  child: TextFormField(
                    controller: Registercontrollerr.namecontroller,
                    style: getRegularStyle(
                        color: Colormanager.greyText, fontSize: 16),
                  )),
              SizedBox(
                height: size.height * .015,
              ),
              // Row(
              //   children: const [
              //     Text("Enter Phone number:"),
              //   ],
              // ),
              // SizedBox(
              //     height: 25,
              //     child: TextFormField(
              //       style: getRegularStyle(
              //           color: Colormanager.greyText, fontSize: 16),
              //     )),
              // SizedBox(
              //   height: size.height * .015,
              // ),
              Row(
                children: const [
                  Text("Enter Email:"),
                ],
              ),
              SizedBox(
                  height: 27,
                  child: TextFormField(
                    controller: Registercontrollerr.emailController,
                    style: getRegularStyle(
                        color: Colormanager.greyText, fontSize: 16),
                  )),
              SizedBox(
                height: size.height * .017,
              ),
              Row(
                children: const [
                  Text("Enter Password:"),
                ],
              ),
              SizedBox(
                  height: 31,
                  child: TextFormField(
                    obscureText: passwordvisible,
                    obscuringCharacter: '*',
                    controller: Registercontrollerr.passwordController,
                    style: getRegularStyle(
                        color: Colormanager.greyText, fontSize: 16),
                          decoration: InputDecoration(
                              
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 131, 130, 130),
                              ),
                              suffixIcon: IconButton(onPressed:(){
                                setState(() {
                                  passwordvisible=!passwordvisible;
                                });
                              }
                               , 
                               icon:Icon(
                                passwordvisible?Icons.visibility_off
                                :Icons.visibility),color: Colormanager.grey,),
                                
                            ),
                  )),
              SizedBox(
                height: size.height * .017,
              ),
              Row(
                children: const [
                  Text("Confirm Password :"),
                ],
              ),
               SizedBox(
                  height: 31,
                  child: TextFormField(
                    controller: Registercontrollerr.confirmpasswordController,
                    obscureText:confirmpasswordvisible,
                    obscuringCharacter: '*',
                    style:
                        TextStyle(color: Colormanager.greyText, fontSize: 16),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      
                              suffixIcon: IconButton(onPressed:(){
                                setState(() {
                                  confirmpasswordvisible=!confirmpasswordvisible;
                                });
                              }
                               , 
                               icon:Icon(
                                confirmpasswordvisible?Icons.visibility_off
                                :Icons.visibility),color: Colormanager.grey,),
                                
                         
                    ),
                  )),
              const SizedBox(
                height:10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Already have an account?",
              //       style: getMediumtStyle(color: Colormanager.greyText),
              //     ),
              //     InkWell(
              //       child: Text(
              //         "Log in",
              //         style: getMediumtStyle(color: Colormanager.primary),
              //       ),
              //       onTap: () {
              //         Navigator.of(context).pushNamed(Routes.loginScreen);
              //       },
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              
                 
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value:_isChecked,
                            onChanged: (value) {
                              setState(() {
                               _isChecked = value??false;
                              });
                            },
                          ),
                          
                          Text("I agree to the",
                              style:
                                  getBoldStyle(color: const Color(0xffafafaf), fontSize: 14)),
                          InkWell(
                            onTap: () {
                              _showTermsAndConditionsDialog();
                            },
                            child: Text(" terms & conditions",
                                style:
                                    getBoldStyle(color: Colormanager.textColor, fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                width: size.width * .8,
                child: ElevatedButton(
                  onPressed: () {
                  validateInput();
                  },
                  style: ElevatedButton.styleFrom(
                    primary:Colormanager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:  Text(
                        "Create Account",
                        style: getMediumtStyle(
                            color: Colormanager.white, fontSize: 16),
                      ),
                  ),
                ),
                     ),
                  
           
              // InkWell(
              //   onTap: ()async{
                  
              //       validateInput();
                 
                 
              //     // if(status){
              //     //   Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
              //     //    showAnimatedSnackBar(context, "REGISTERED SUCCESSFULY",
              //     //                   type: AnimatedSnackBarType.success);
              //     // }else {
              //     //               showAnimatedSnackBar(context, "",
              //     //                   type: AnimatedSnackBarType.error);}
              //     //                   setState(() {
              //     //                     _isLoading=false;
              //     //                   });

              //   },
              //    child: Ink(
              //     decoration: BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.circular(12),
              //     ),
                
              //   child: Container(
              //     width: size.width * .8,
              //     decoration: BoxDecoration(
              //         color: Colormanager.primary,
              //         borderRadius: BorderRadius.circular(12)),
              //     // height: 40,
              //     child: Center(
              //       child: Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Text(
              //           "Create Account",
              //           style: getMediumtStyle(
              //               color: Colormanager.white, fontSize: 16),
              //         ),
              //       ),
              //     ),
              //   ),
                
              // ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   width: size.width * .8, height: 40,
              //   decoration: BoxDecoration(
              //       color: Colormanager.grey,
              //       borderRadius: BorderRadius.circular(12)),
              //   // height: 40,
              //   child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Row(
              //         // mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SizedBox(
              //             width: size.width * .15,
              //           ),
              //           Image.asset(
              //             AssetImages.google,
              //             width: 40,
              //             height: 40,
              //             fit: BoxFit.cover,
              //           ),
              //           Text(
              //             "Continue With Google",
              //             style: getMediumtStyle(
              //                 color: Colormanager.greyText, fontSize: 12),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   width: size.width * .8,
              //   decoration: BoxDecoration(
              //       color: Colormanager.blue,
              //       borderRadius: BorderRadius.circular(12)),
              //   // height: 40,
              //   child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Row(
              //         // mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SizedBox(
              //             width: size.width * .15,
              //           ),
              //           CircleAvatar(
              //             maxRadius: 10,
              //             backgroundColor: Colormanager.white,
              //             child: Image.asset(
              //               AssetImages.fb,
              //               // width: 25,
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             "Continue With Facebook",
              //             style: getMediumtStyle(
              //                 color: Colormanager.white, fontSize: 12),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
    
  }
}


