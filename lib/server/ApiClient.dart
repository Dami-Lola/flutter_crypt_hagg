
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/GraphQLConfig.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class ApiClients{


  ///generic response
  final  ApiClientResponse  response =  ApiClientResponse();




  ///network handshake
  Future<ApiClientResponse>  login(String data,AuthStore store) async {
    try {

      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery(store);
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


  Future<ApiClientResponse>  createAccount(String data,AuthStore store) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery(store);
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
        var data = AccessToken.fromJson(result.data["register"]);


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


  Future<ApiClientResponse>  verifyUser(String data,AuthStore store) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery(store);
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
        var data = AccessToken.fromJson(result.data['verifyUser']);

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



  Future<ApiClientResponse>  resendVerificationCode(String data,AuthStore store,String email) async {
    try {
      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery(store);
      QueryResult result = await _client.query(
        QueryOptions(
          document: gql(data), // this
          variables: {
            "email": "$email"
          }
        ),

      );
      if(result.hasException){
        print(result.exception?.graphqlErrors[0]?.message);
        response.hasError = true;
        response.message = result.exception?.graphqlErrors[0]?.message ?? "connection problem";

      }else if(result.data!= null){
        var data = AccessToken();
        data.resendVerificationCode = result.data["resendVerificationCode"];
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





  Future<ApiClientResponse>  getUserProfileDetails(String data,AuthStore store) async {
    try {

      ///initializing GraphQLConfig
      GraphQLConfig  graphQLConfiguration  = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery(store);
      QueryResult result = await _client.query(
        QueryOptions(
          document: gql(data), // this
        ),
      );
      if(result.hasException){
        print(result.exception?.graphqlErrors[0]?.message);
        response.hasError = true;
        response.message = result.exception?.graphqlErrors[0]?.message ?? "connection problem";

      }else if(result.data!= null){
        var data = AccessToken();
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