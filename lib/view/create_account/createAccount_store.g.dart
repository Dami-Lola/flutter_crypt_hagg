// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createAccount_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountStore on _CreateAccountStore, Store {
  final _$loadingAtom = Atom(name: '_CreateAccountStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$emailAtom = Atom(name: '_CreateAccountStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CreateAccountStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$userNameAtom = Atom(name: '_CreateAccountStore.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_CreateAccountStore.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$referralCodeAtom = Atom(name: '_CreateAccountStore.referralCode');

  @override
  String get referralCode {
    _$referralCodeAtom.reportRead();
    return super.referralCode;
  }

  @override
  set referralCode(String value) {
    _$referralCodeAtom.reportWrite(value, super.referralCode, () {
      super.referralCode = value;
    });
  }

  final _$passwordVisibleAtom =
      Atom(name: '_CreateAccountStore.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$loadCountryAsyncAction =
      AsyncAction('_CreateAccountStore.loadCountry');

  @override
  Future<void> loadCountry() {
    return _$loadCountryAsyncAction.run(() => super.loadCountry());
  }

  final _$_CreateAccountStoreActionController =
      ActionController(name: '_CreateAccountStore');

  @override
  void load(bool load) {
    final _$actionInfo = _$_CreateAccountStoreActionController.startAction(
        name: '_CreateAccountStore.load');
    try {
      return super.load(load);
    } finally {
      _$_CreateAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_CreateAccountStoreActionController.startAction(
        name: '_CreateAccountStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_CreateAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_CreateAccountStoreActionController.startAction(
        name: '_CreateAccountStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_CreateAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUser(String value) {
    final _$actionInfo = _$_CreateAccountStoreActionController.startAction(
        name: '_CreateAccountStore.validateUser');
    try {
      return super.validateUser(value);
    } finally {
      _$_CreateAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhoneNumber(String value) {
    final _$actionInfo = _$_CreateAccountStoreActionController.startAction(
        name: '_CreateAccountStore.validatePhoneNumber');
    try {
      return super.validatePhoneNumber(value);
    } finally {
      _$_CreateAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email},
password: ${password},
userName: ${userName},
phoneNumber: ${phoneNumber},
referralCode: ${referralCode},
passwordVisible: ${passwordVisible}
    ''';
  }
}

mixin _$CreateAccountErrorStore on _CreateAccountErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_CreateAccountErrorStore.hasErrors'))
          .value;

  final _$emailAtom = Atom(name: '_CreateAccountErrorStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CreateAccountErrorStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$userNameAtom = Atom(name: '_CreateAccountErrorStore.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_CreateAccountErrorStore.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$referralCodeAtom =
      Atom(name: '_CreateAccountErrorStore.referralCode');

  @override
  String get referralCode {
    _$referralCodeAtom.reportRead();
    return super.referralCode;
  }

  @override
  set referralCode(String value) {
    _$referralCodeAtom.reportWrite(value, super.referralCode, () {
      super.referralCode = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
userName: ${userName},
phoneNumber: ${phoneNumber},
referralCode: ${referralCode},
hasErrors: ${hasErrors}
    ''';
  }
}
