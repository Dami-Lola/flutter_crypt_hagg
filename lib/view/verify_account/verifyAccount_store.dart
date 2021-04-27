
import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/server/ApiClient.dart';
import 'package:flutter_crypt_hagg/server/MutableGraphQLConfigClients.dart';
import 'package:flutter_crypt_hagg/server/QueryGraphQLConfigClients.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/completescreen/complete_screen.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard_store.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_screen.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';

import 'package:mobx/mobx.dart';


import 'package:validators/validators.dart';




part 'verifyAccount_store.g.dart';

class VerifyAccountStore = _VerifyAccountStore with _$VerifyAccountStore;

abstract class _VerifyAccountStore with Store {

  final VerifyAccountErrorStore error = VerifyAccountErrorStore();


  @observable
  bool loading = false;


  @observable
  String pinCode;




  @action
  void load(bool load) {
    this.loading = load;
  }





  @action
  void validatePinCode(String value) {
    if (isNull(value) || value.isEmpty)
      error.pinCode = 'Pin is required';
    else
      error.pinCode = null;
  }



  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => pinCode, validatePinCode),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    //when submit button is clicked, validation on email text field and password text field is check
    validatePinCode(pinCode);
    return error.hasErrors;
  }

//
  Future<void> submitPin( {BuildContext context,Function(String) e,AuthStore authStore}) async {

    //call button validation
    if (hasErrors) return;

    load(true);



    try {

      ///convert pin from string to int and put in try catch if conversion failed
      var  pin = int.parse(pinCode);

      String data = MutableGraphQLConfigClients().verifyUser(pin);



      ApiClientResponse res  =   await  ApiClients().verifyUser(data,authStore) ;


      ///check for error
      if(res.hasError){
        e(res.message.toString());
        load(false);
      }else{
        ///else  we are good
        ///

        Navigator.of(context).pushNamedAndRemoveUntil(
            CompleteScreen.routeName, (r) => false);

      }
  //


    }  catch (err) {
      e(err.toString());
      load(false);
    } finally {
      load(false);
    }


  }

  Future<void> resendVerificationPin( {@required String email,Function(String) m,Function(bool) isLoading,AuthStore authStore}) async {
    try {

      isLoading(true);
      String daa = QueryGraphQLConfigClients.resendVerification(email);
      String data = QueryGraphQLConfigClients.getUserProfile();


      ApiClientResponse res  =   await  ApiClients().resendVerificationCode(data,authStore) ;
      AccessToken results = AccessToken();
      results =    res.data;

      ///check for error
      if(res.hasError){
        m(res.message.toString());
        load(false);

      }else if(!results.resendVerificationCode){
        ///it means something happen with the pin system, so user can re-triggered
       m("Code not send, please try again");
      }else {
        m("Successful!, Please check your email");
      }
    }  catch (err) {
      m(err.toString());
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}

 class VerifyAccountErrorStore = _VerifyAccountErrorStore with _$VerifyAccountErrorStore;

abstract class _VerifyAccountErrorStore with Store {


  @observable
  String pinCode;


  @computed
  bool get hasErrors => pinCode != null  ;
}
