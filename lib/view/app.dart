
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/router/routes.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/splash_screens.dart';
import 'package:provider/provider.dart';


class HagglexApp extends StatefulWidget {
  @override
  _HagglexApp createState() => _HagglexApp();
}

class _HagglexApp extends State<HagglexApp> {
  AuthStore authStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    authStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    authStore = Provider.of<AuthStore>(context);
    authStore.persistAuth();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hagglex',

      // initialRoute: authStore.onboarded
      //     ? authStore.loginPin == null || authStore.isBiometricEnable
      //         ? LoginPinBiometricScreen.routeName
      //         : WelcomeScreen.routeName
      //     : SplashScreen.routeName,


    //initialRoute: LoginPinBiometrics.routeName,

     initialRoute: SplashScreens.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        fontFamily: 'BasisGrotesqueProRegular',

        // primarySwatch: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
