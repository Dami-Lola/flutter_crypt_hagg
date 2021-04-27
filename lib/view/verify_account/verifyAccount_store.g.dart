// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifyAccount_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VerifyAccountStore on _VerifyAccountStore, Store {
  final _$loadingAtom = Atom(name: '_VerifyAccountStore.loading');

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

  final _$pinCodeAtom = Atom(name: '_VerifyAccountStore.pinCode');

  @override
  String get pinCode {
    _$pinCodeAtom.reportRead();
    return super.pinCode;
  }

  @override
  set pinCode(String value) {
    _$pinCodeAtom.reportWrite(value, super.pinCode, () {
      super.pinCode = value;
    });
  }

  final _$_VerifyAccountStoreActionController =
      ActionController(name: '_VerifyAccountStore');

  @override
  void load(bool load) {
    final _$actionInfo = _$_VerifyAccountStoreActionController.startAction(
        name: '_VerifyAccountStore.load');
    try {
      return super.load(load);
    } finally {
      _$_VerifyAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePinCode(String value) {
    final _$actionInfo = _$_VerifyAccountStoreActionController.startAction(
        name: '_VerifyAccountStore.validatePinCode');
    try {
      return super.validatePinCode(value);
    } finally {
      _$_VerifyAccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
pinCode: ${pinCode}
    ''';
  }
}

mixin _$VerifyAccountErrorStore on _VerifyAccountErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_VerifyAccountErrorStore.hasErrors'))
          .value;

  final _$pinCodeAtom = Atom(name: '_VerifyAccountErrorStore.pinCode');

  @override
  String get pinCode {
    _$pinCodeAtom.reportRead();
    return super.pinCode;
  }

  @override
  set pinCode(String value) {
    _$pinCodeAtom.reportWrite(value, super.pinCode, () {
      super.pinCode = value;
    });
  }

  @override
  String toString() {
    return '''
pinCode: ${pinCode},
hasErrors: ${hasErrors}
    ''';
  }
}
