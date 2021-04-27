
import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/ApiClient.dart';
import 'package:flutter_crypt_hagg/server/MutableGraphQLConfigClients.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_dashboard_store.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_screen.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';

import 'package:mobx/mobx.dart';


import 'package:validators/validators.dart';




part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginErrorStore error = LoginErrorStore();


  @observable
  bool loading = false;


  @observable
  String email;

  @observable
  String password;


  @observable
  bool passwordVisible = true;


  @action
  void load(bool load) {
    this.loading = load;
  }




  @action
  void validatePassword(String value) {
    if (isNull(value) || value.isEmpty)
      error.password = 'Password is required';
    else if (value.length < 7)
      error.password = 'Password must be at least 8 characters long';
    else
      error.password = null;
  }


  @action
  void validateEmail(String value) {
    if (isNull(value) || value.isEmpty)
      error.email = 'Email is required';
    else if (!isEmail(value))
      error.email = 'Enter a valid email';
    else
      error.email = null;
  }



  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [

      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    //when submit button is clicked, validation on email text field and password text field is check
    validateEmail(email);
    validatePassword(password);


    return error.hasErrors;
  }


  Future<void> submit( {BuildContext context,Function(String) e,AuthStore authStore}) async {

    //call button validation
    if (hasErrors) return;

    load(true);

    String data = MutableGraphQLConfigClients().login(email, password);

    try {
      String data = MutableGraphQLConfigClients().login(email, password);

      ApiClientResponse res  =   await  ApiClients().login(data,authStore) ;


      ///check for error
      if(res.hasError){
        e(res.message.toString());
        load(false);
      }else{
        ///else  we are good


        AccessToken results = AccessToken();


        results =    res.data;

        ///persist to secure storage

        //for my testing purpose to clear data before saving
        authStore.clearAuthStorage();

        authStore.accessToken = results;
        authStore.persistAuth();


        if(results.user.phoneNumberVerified) {
          ///move to verification
          Navigator.of(context).pushNamedAndRemoveUntil(
              HomeDashboard.routeName, (r) => false);
        }else{
          Navigator.of(context).pushNamed(VerifyAccount.routeName);
        }

      }
  //


    }  catch (err) {
      e(err.toString());
      load(false);
    } finally {
      load(false);
    }


  }



}

 class LoginErrorStore = _LoginErrorStore with _$LoginErrorStore;

abstract class _LoginErrorStore with Store {
  @observable
  String email;

  @observable
  String password;




  @computed
  bool get hasErrors => email != null || password != null ;
}
