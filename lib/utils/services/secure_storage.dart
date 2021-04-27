import 'package:flutter_crypt_hagg/utils/constant/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage secureStorage = FlutterSecureStorage();

///secure storage to store credentials
///this can be encrypted before saving if more security is required
abstract class Storage {

  static Future<String> getUser() async {
    String data = await secureStorage.read(key: USER);
    return data;
  }

  static Future<void> storeUser(String auth) async {
    await secureStorage.write(key: USER, value: auth);
  }

  static Future<void> deleteUser() async {
    await secureStorage.delete(key: USER);
  }

}
