import 'package:flutter/material.dart';
import 'package:otodeals/presentation/screens/forget_pass_screen.dart';
import 'package:otodeals/presentation/screens/landing_screen.dart';
import 'package:otodeals/presentation/screens/login_screen.dart';
import 'package:otodeals/presentation/screens/resgister_account.dart';
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
