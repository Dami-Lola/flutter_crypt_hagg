
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/utils/router/routes.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/splashScreen/splash_screens.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'dashboard/home_dashboard/home_screen.dart';
import 'dashboard/home_parent_bottomnav.dart';



class HagglexApp extends StatefulWidget {
 final ValueNotifier<GraphQLClient> client;
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
    //for my testing purpose to clear data before saving
    authStore.clearAuthStorage();
    authStore.persistAuth();

    return GraphQLProvider(
        client: widget.client,
        child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hagglex',

       // initialRoute: authStore?.pageToGo(),



        initialRoute: HomeParentDashboard.routeName,


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
