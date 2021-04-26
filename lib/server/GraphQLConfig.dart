
import "package:flutter/material.dart";
import 'package:flutter_crypt_hagg/utils/config/config.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfig  {

  static HttpLink httpLink = HttpLink(
    Config.baseUrl,
  );
 static  ValueNotifier<GraphQLClient> graphInit({AuthStore authStore})  {
    // We're using HiveStore for persistence,
    // so we need to initialize Hive.





    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${authStore?.token}',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );

    return client;
  }




 // final AuthLink authLink = AuthLink(
 //   getToken: () async => 'Bearer ${authStore?.token}',
 // );

 // final Link link = authLink.concat(httpLink);

 ValueNotifier<GraphQLClient> client = ValueNotifier(
   GraphQLClient(
     link: httpLink,
     // The default store is the InMemoryStore, which does NOT persist to disk
     cache: GraphQLCache(
       store: HiveStore(),
     ),
   ),
 );


 GraphQLClient clientToQuery() {
   return GraphQLClient(
     cache: GraphQLCache(
       store: HiveStore(),
     ),
     link: httpLink,
   );
 }
}