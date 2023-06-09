import 'package:flutter/material.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/profile.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/search.dart';
import 'package:otodeals/presentation/screens/editprofile.dart';
import 'package:otodeals/presentation/screens/forget_pass_screen.dart';
import 'package:otodeals/presentation/screens/landing_screen.dart';
import 'package:otodeals/presentation/screens/login_screen.dart';
import 'package:otodeals/presentation/screens/main_screen.dart';
import 'package:otodeals/presentation/screens/mobile_ver_screen.dart';
import 'package:otodeals/presentation/screens/otp_screen.dart';
import 'package:otodeals/presentation/screens/otp_screen_email.dart';
import 'package:otodeals/presentation/screens/resgister_account.dart';
import 'package:otodeals/presentation/screens/search_result_bid.dart';
import 'package:otodeals/presentation/screens/splash_screen.dart';
import 'package:otodeals/presentation/screens/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String welcomeScreen = '/welcomeScreen';
  static const String landingScreen = '/landingScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String forgetPassScreen = '/forgetPassScreen';
  static const String resetPassScreen = '/resetPassScreen';
  static const String mobileVerificationScreen = '/mobileVerificationScreen';
  static const String otpScreen = '/otpScreen';
  static const String mailotpScreen = '/mailotpScreen';
  static const String mainScreen = '/mainScreen';
  static const String searchs='/searchs';
  static const String searchbidscreen='/searchbidscreen';
  static const String profilescreen='/profilescreen';
  static const String editprofilescreen='/editprofilescreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.landingScreen:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterAccount());
      case Routes.forgetPassScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPassScreen());
      case Routes.mobileVerificationScreen:
        return MaterialPageRoute(builder: (_) => const MobileVerScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OTPscreen());
         case Routes.mailotpScreen:
        return MaterialPageRoute(builder: (_) => const OTPscreenmail());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
         case Routes.searchs:
        return MaterialPageRoute(builder: (_) =>const searchs());
         case Routes.searchbidscreen:
        return MaterialPageRoute(builder: (_) =>const Bidsearch ());
         case Routes.profilescreen:
        return MaterialPageRoute(builder: (_) =>const Myprofile());
         case Routes.editprofilescreen:
        return MaterialPageRoute(builder: (_) =>const Editprofile());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),
        ),
        body: const Center(
          child: Text("No Route Found"),
        ),
      ),
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadePageRoute({ required this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return page;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
