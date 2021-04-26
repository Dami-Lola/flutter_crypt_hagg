


import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiClients{

  ApiClientResponse _handleError( e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print('API client error [status] ==> ${e.response.statusCode}');
      print('API client error [data] ==> ${e.response.data}');

      // Handle Unauthorized error
      if (e.response.statusCode == 401) {

      }

      //var ad =  jsonDecode(e.response.toString());
      ApiClientResponse res = ApiClientResponse.fromJson(e.response.data);
      var errMsg, er;
      if (res.errors != null && res.errors.length >= 1) {
        // res.errors["password"]!= null ? errMsg = res.errors["password"].toString() : er = "";
        // res.errors["image"]!= null ? errMsg = res.errors["image"].toString() : er ="";
        // res.errors["dob"]!= null ? errMsg = res.errors["dob"].toString() : er ="";
        // res.errors["gender"]!= null ? errMsg = res.errors["gender"].toString() : er ="";
        // res.errors["phone"]!= null ? errMsg = res.errors["phone"].toString() :er = "";
        // res.errors["first_name"]!= null ? errMsg = res.errors["first_name"].toString() :er = "";
        // res.errors["last_name"]!= null ? errMsg = res.errors["last_name"].toString() :er = "";
        // res.errors["otp"]!= null ? errMsg = res.errors["otp"].toString() :er = "";
        // res.errors["email"]!= null ? errMsg = res.errors["email"].toString() :er = "";
        // //res.data["message"]!= null ? errMsg = res.data["message"].toString() :er = "";
        res.message = errMsg;
      }

      return res;
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print('API client error ==> ${e.message}');
      return ApiClientResponse(responseMessage: 'Network error. Try again later.');
    }
  }



   login(String data) async {

     Mutation(
       options: MutationOptions(
         document: gql(data), // this is the mutation string you just created
         // you can update the cache based on results
         update: (GraphQLDataProxy cache, QueryResult result) {
           return cache;
         },
         // or do something with the result.data on completion
         onCompleted: (dynamic resultData) {
           print(resultData);
           print("on completed");
         },
       ),
       builder: (RunMutation runMutation,
           QueryResult result,) {



         print(result.data);
         ApiClientResponse.fromJson(result.data);

         return Container();
       },
     );
  }



}