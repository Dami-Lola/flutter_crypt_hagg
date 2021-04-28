
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/utils/router/routes.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/splashScreen/splash_screens.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'dashboard/home_dashboard/home_screen.dart';
import 'dashboard/home_parent_bottomnav.dart';



class HagglexApp extends StatefulWidget {
 final ValueNotifier<GraphQLClient> client;
 //injecting graphql
 HagglexApp({this.client});

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

    return GraphQLProvider(
        client: widget.client,
        child:MaterialApp(
          //easy loading library to show dialog
          builder: EasyLoading.init(),

          debugShowCheckedModeBanner: false,
        title: 'Hagglex',


        initialRoute: authStore?.pageToGo(),

        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
        fontFamily: AppFonts.RegularFonts,


        // primarySwatch: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,


    ),
    )
    );
  }
}
