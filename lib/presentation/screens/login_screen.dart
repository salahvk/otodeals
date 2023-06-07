import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/presentation/widgets/terms_and_condition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

    String _errorMessage = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      String email = _emailController.text;
      String password = _passwordController.text;
      
      // Example validation
      if (email== 'admin@gmail.com' && password == 'password') {
        _errorMessage = '';
        Navigator.of(context).pushNamed(Routes.mobileVerificationScreen);
        // Navigate to home page or perform desired action
      } else {
        setState(() { 
        _errorMessage = '*Invalid username or password';
        });
      }
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
                height: size.height * .6,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children:<Widget> [
                      SizedBox(
                        height: size.height * .12,
                      ),
                      SizedBox(
                          width: size.width * .6,
                          child: Image.asset(AssetImages.logoBlack)),
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
                          height:40,
                          child: TextFormField(
                            controller:_emailController ,
                            decoration: InputDecoration(

                              
                            ),
                            obscureText: true,
                            style: getRegularStyle(
                                color: Colormanager.greyText, fontSize: 16),
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'please enter your email';
                                  }
                                  return null;
                                },
                          ),
                          ),
                      SizedBox(
                        height: size.height * .015,
                      ),
                      Row(
                        children: const [
                          Text("Password :"),
                        ],
                      ),
                       SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            style: TextStyle(
                                color: Colormanager.greyText, fontSize: 16),
                            decoration: InputDecoration(
                              
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'please enter your password';
                              }
                              return null;
                            },
                          ),
                          ),
                          SizedBox(height:10,),
                          Padding(
                            padding: const EdgeInsets.only(right:108.0),
                            child: Text(
                                          _errorMessage,
                                          style: getSemiBoldStyle(color:Colormanager.primary),
                                        ),
                          ),
                      const SizedBox(
                        height:15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create an account?",
                            style: getMediumtStyle(color: Colormanager.greyText),
                          ),
                          InkWell(
                            child: Text(
                              "Register",
                              style: getMediumtStyle(color: Colormanager.primary),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.registerScreen);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const TermsAndCondition(),
                    InkWell(
                      onTap: () {
                        _login();
                        // Navigator.of(context)
                        //     .pushNamed(Routes.mobileVerificationScreen);
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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgetPassScreen);
                      },
                      child: Text(
                        "Forget Password?",
                        style: getMediumtStyle(color: Colormanager.greyText),
                      ),
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
