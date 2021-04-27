import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dart_json_mapper_mobx/dart_json_mapper_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crypt_hagg/main.reflectable.dart';
import 'package:flutter_crypt_hagg/server/GraphQLConfig.dart';
import 'package:flutter_crypt_hagg/utils/services/secure_storage.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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

  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();




  // launch app
  runApp(MyApp(authStore:authStore));
}





class MyApp extends StatelessWidget {


  final AuthStore authStore ;
  final ValueNotifier<GraphQLClient> client;
  MyApp({this.authStore,this.client});

  @override
  Widget build(BuildContext context) {
    //GraphQLConfig init
    ValueNotifier<GraphQLClient> client = GraphQLConfig(authStore).graphInit();
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => authStore),
        Provider<ValueNotifier<GraphQLClient>>(create: (_) => client),
      ],
      child: HagglexApp(client:client),
    );
  }
}

