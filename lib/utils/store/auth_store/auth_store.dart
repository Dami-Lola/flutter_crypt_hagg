import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_crypt_hagg/model/access_token/access_token.dart';
import 'package:flutter_crypt_hagg/model/user/user.dart';
import 'package:flutter_crypt_hagg/utils/services/secure_storage.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_screen.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_parent_bottomnav.dart';
import 'package:flutter_crypt_hagg/view/splashScreen/splash_screens.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';
import 'package:mobx/mobx.dart';



part 'auth_store.g.dart';

@jsonSerializable
class AuthStore extends _AuthStore with _$AuthStore {}

@jsonSerializable
abstract class _AuthStore with Store {




  @observable
  AccessToken accessToken;





  @computed
  String get token => accessToken?.token;


  clearAuthStorage(){
    Storage.deleteUser();
  }

 String pageToGo(){
    ///check is users has logged in or created account before
    if( accessToken != null  && accessToken?.user?.email!= null){


      ///check if user is verified
      if(accessToken.user.emailVerified){

        ///checking if email has been verified
        ///go to dashboard
        return   HomeParentDashboard.routeName;
      }else{
        return  ///go verify email
          VerifyAccount.routeName;
      }
    }
    else {

      ///else you are a new user
      return SplashScreens.routeName;
    }

  }

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
