
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/view/completescreen/complete_screen.dart';
import 'package:flutter_crypt_hagg/view/countryScreen/countryScreen.dart';
import 'package:flutter_crypt_hagg/view/create_account/createAccount_screen.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_screen.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_parent_bottomnav.dart';
import 'package:flutter_crypt_hagg/view/login_screen/login_screen.dart';
import 'package:flutter_crypt_hagg/view/splashScreen/splash_screens.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';

import '../logout.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case SplashScreens.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreens());


      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());


      case CreateAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => CreateAccountScreen());

      case VerifyAccount.routeName:
        return MaterialPageRoute(builder: (_) => VerifyAccount());

      case CompleteScreen.routeName:
        return MaterialPageRoute(builder: (_) => CompleteScreen());

      case HomeDashboard.routeName:
        return MaterialPageRoute(builder: (_) => HomeDashboard());

      case CountryScreen.routeName:
        return MaterialPageRoute(builder: (_) => CountryScreen());

      case HomeParentDashboard.routeName:
        return MaterialPageRoute(builder: (_) => HomeParentDashboard());

      case LogoOut.routeName:
        return MaterialPageRoute(builder: (_) => LogoOut());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
