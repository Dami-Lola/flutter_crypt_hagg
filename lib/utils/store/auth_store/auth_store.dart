import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/user/user.dart';
import 'package:flutter_crypt_hagg/utils/services/secure_storage.dart';
import 'package:mobx/mobx.dart';



part 'auth_store.g.dart';

@jsonSerializable
class AuthStore extends _AuthStore with _$AuthStore {}

@jsonSerializable
abstract class _AuthStore with Store {
  @observable
  User user;



  @observable
  AccessToken accessToken;





  @computed
  String get token => accessToken?.token;

  @computed
  String get refreshToken => accessToken?.refreshToken;

  @computed
  bool get auth => accessToken != null && user != null;

  List<ReactionDisposer> _disposers;

  /// This method helps persist the auth store in the device secure storage.
  /// Each observable field or property are tracked such that when the value is
  /// changed across the app, it triggers the reaction function which first
  /// serializies the store with the help of `JsonMapper.serialize(object)` lib
  /// then calls the `Storage.storeUser(str)` where the serialized string is passed.
  ///
  /// Be sure to recreate this process whenever a new observable field or property
  /// is added.
  void persistAuth() {
    _disposers = [
      reaction((_) => user,
          (_) async => await Storage.storeUser(JsonMapper.serialize(this))),
      reaction((_) => accessToken,
          (_) async => await Storage.storeUser(JsonMapper.serialize(this))),


    ];
  }

  /// Call this to method to clear all listners and trackers.
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
