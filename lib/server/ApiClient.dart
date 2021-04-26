
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/GraphQLConfig.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class ApiClients{

  ///initializing GraphQLConfig
  GraphQLConfig  graphQLConfiguration  = GraphQLConfig();

  ///generic response
  final  ApiClientResponse  response =  ApiClientResponse();




  ///network handshake
  Future<ApiClientResponse>  login(String data) async {
    try {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.mutate(
        MutationOptions(
          document: gql(data), // this
        ),
      );
      if(result.hasException){
        print(result.exception?.graphqlErrors[0]?.message);
        response.hasError = true;
        response.message = result.exception?.graphqlErrors[0]?.message ?? "connection problem";

      }else if(result.data!= null){
        var data = AccessToken.fromJson(result.data["login"]);
        response.hasError = false;
        response.data = data;
      }

      return response;
    }catch(e){
      print(e);
      response.hasError = true;
      response.message = e.toString();
      return response;

    }




  }



}