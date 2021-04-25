import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dart_json_mapper_mobx/dart_json_mapper_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crypt_hagg/utils/config/config.dart';
import 'package:flutter_crypt_hagg/main.reflectable.dart';
import 'package:flutter_crypt_hagg/utils/services/api_client.dart';
import 'package:flutter_crypt_hagg/utils/services/secure_storage.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  // Initialize builders and binders
  initializeReflectable();

  WidgetsFlutterBinding.ensureInitialized();



  // Setup orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  // hydarate store
  AuthStore authStore;
  try {
    String data = await Storage.getUser();
    authStore =
    data == null ? AuthStore() : JsonMapper.deserialize<AuthStore>(data);
    // print(data);
  } catch (e) {
    authStore = AuthStore();
  }

  // launch app
  runApp(MyApp(authStore));
}





class MyApp extends StatelessWidget {

  final AuthStore authStore ;

  MyApp(this.authStore);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider<AuthStore>(create: (_) => authStore),
        Provider<ApiClient>(create: (_) => ApiClient(authStore)),
      ],
      child: HagglexApp(),
    );
  }
}

