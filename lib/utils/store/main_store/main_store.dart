import 'package:flutter_crypt_hagg/model/user/user.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore extends _MainStore with _$MainStore {
  MainStore(AuthStore auth) : super(auth);
}

abstract class _MainStore with Store {
  AuthStore auth;

  _MainStore(this.auth);

  @observable
  User hydarated;
}
