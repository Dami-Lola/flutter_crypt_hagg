// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<String> _$tokenComputed;

  @override
  String get token => (_$tokenComputed ??=
          Computed<String>(() => super.token, name: '_AuthStore.token'))
      .value;
  Computed<String> _$refreshTokenComputed;

  @override
  String get refreshToken =>
      (_$refreshTokenComputed ??= Computed<String>(() => super.refreshToken,
              name: '_AuthStore.refreshToken'))
          .value;
  Computed<bool> _$authComputed;

  @override
  bool get auth => (_$authComputed ??=
          Computed<bool>(() => super.auth, name: '_AuthStore.auth'))
      .value;

  final _$userAtom = Atom(name: '_AuthStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$accessTokenAtom = Atom(name: '_AuthStore.accessToken');

  @override
  AccessToken get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(AccessToken value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
accessToken: ${accessToken},
token: ${token},
refreshToken: ${refreshToken},
auth: ${auth}
    ''';
  }
}
