
import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/ApiClient.dart';
import 'package:flutter_crypt_hagg/server/MutableGraphQLConfigClients.dart';
import 'package:flutter_crypt_hagg/server/QueryGraphQLConfigClients.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_dashboard_store.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_screen.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_parent_bottomnav.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';

import 'package:mobx/mobx.dart';


import 'package:validators/validators.dart';







 class UserProfileStore {


  Future<void> submit( {BuildContext context,AuthStore authStore}) async {
    try {
      String data = QueryGraphQLConfigClients.getUserProfile();
      ApiClientResponse res  =   await  ApiClients().getUserProfileDetails(data,authStore) ;
      ///check for error
      if(res.data != null){
        ///else  we are good
        AccessToken results = AccessToken();
        results =    res.data;
        ///persist to secure storage
        //for my testing purpose to clear data before saving
        authStore.clearAuthStorage();
        authStore.accessToken = results;
        authStore.persistAuth();

      }
    }  catch (err) {
      print(err.toString());

    }


  }



}
