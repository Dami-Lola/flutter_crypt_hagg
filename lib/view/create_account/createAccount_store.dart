
import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/ApiClient.dart';
import 'package:flutter_crypt_hagg/server/MutableGraphQLConfigClients.dart';
import 'package:flutter_crypt_hagg/utils/locale.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_screen.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobx/mobx.dart';


import 'package:validators/validators.dart';




part 'createAccount_store.g.dart';

class CreateAccountStore = _CreateAccountStore with _$CreateAccountStore;

abstract class _CreateAccountStore with Store {
  final CreateAccountErrorStore error = CreateAccountErrorStore();



  @observable
  bool loading = false;


  @observable
  String email;


  @observable
  String password;


  @observable
  String userName;


  @observable
  String phoneNumber;


  @observable
  String referralCode;


  @observable
  bool passwordVisible = true;


  @action
  void load(bool load) {
    this.loading = load;
  }


  String country = "Nigeria";
  @action
  Future<void> loadCountry() async {
    Response data = await http.get('http://ip-api.com/json');
    Map dataa = jsonDecode(data.body);
     country = dataa['country'];
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

  @action
  void validateUser(String value) {
    if (isNull(value) || value.isEmpty)
      error.userName = 'UserName is required';
    else
      error.userName = null;
  }

  @action
  void validatePhoneNumber(String value) {
    if (isNull(value) || value.isEmpty)
      error.phoneNumber = 'phone Number is required';
    else
      error.phoneNumber = null;
  }


  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => userName, validateUser),
      reaction((_) => phoneNumber, validatePhoneNumber)
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
    validatePhoneNumber(phoneNumber);
    validateUser(userName);

    return error.hasErrors;
  }


  Future<void> submit( {BuildContext context,Function(String) e,AuthStore authStore}) async {

    //call button validation
    if (hasErrors) return;

    load(true);

    ///get current country


    ///get  country currency
    // Locale local = Localizations.localeOf(context);
    var format = UserLocale.fetchLocale(context);



    ///make network call
    String data = MutableGraphQLConfigClients().createUser(email,userName, password,country,format?.currencyName??"NGN",phoneNumber);

    try {

      ApiClientResponse res  =   await  ApiClients().createAccount(data,authStore) ;


      ///check for error
      if(res.hasError){
        e(res.message.toString());
        load(false);
      }else{
        ///else  we are good


        AccessToken results = AccessToken();
        results =    res.data;

        ///persist to secure storage
        authStore.accessToken = results;
        authStore.persistAuth();


        ///move to verification
        Navigator.of(context).pushNamed(VerifyAccount.routeName);

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

 class CreateAccountErrorStore = _CreateAccountErrorStore with _$CreateAccountErrorStore;

abstract class _CreateAccountErrorStore with Store {
  @observable
  String email;

  @observable
  String password;

  @observable
  String userName;

  @observable
  String phoneNumber;

  @observable
  String referralCode;

  @computed
  bool get hasErrors => email != null || password != null || userName != null || phoneNumber != null ;
}
