
import 'package:flutter/cupertino.dart';
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
    error.password = isNull(value) || value.isEmpty ? 'Password is required' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isNull(value) || value.isEmpty ? 'Email is required' : null;
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


  Future<void> submit( BuildContext context) async {

    //call button validation
    if (hasErrors) return;



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
