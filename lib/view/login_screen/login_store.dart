
import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/ApiClient.dart';
import 'package:flutter_crypt_hagg/server/MutableGraphQLConfigClients.dart';

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


  Future<void> submit( {BuildContext context,Function(String) e}) async {

    //call button validation
    if (hasErrors) return;

    load(true);

    String data = MutableGraphQLConfigClients().login(email, password);

    try {

      ApiClientResponse res  =   await  ApiClients().login(data) ;


      ///check for error
      if(res.hasError){
        e(res.message.toString());
        load(false);
      }else{
        ///else  we are good

        AccessToken ade =    res.data;


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
