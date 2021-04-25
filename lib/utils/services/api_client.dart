
import 'package:dio/dio.dart';
import 'package:flutter_crypt_hagg/utils/config/config.dart';
import 'package:flutter_crypt_hagg/model/api_client_response/api_client_response.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';

class ApiClient {
  Dio dio;
  BaseOptions baseOptions = new BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: 30000,
  );

  final AuthStore auth;

  ApiClient(this.auth) {
    this.dio = Dio(baseOptions);
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, request: true, error: true));

  }

  String get token => auth.token;

  String get refreshtoken => auth.refreshToken;

  Options get options {
    return Options(headers: {
      'authorization': 'Bearer $token',
    });
  }

  Options get optionsrefresh {
    return Options(headers: {
      'authorization': 'Bearer $refreshtoken',
    });
  }

  ApiClientResponse _handleError(DioError e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print('API client error [status] ==> ${e.response.statusCode}');
      print('API client error [data] ==> ${e.response.data}');

      // Handle Unauthorized error
      if (e.response.statusCode == 401) {

      }

      ApiClientResponse res = ApiClientResponse.fromJson(e.response.data);

      if (res.errors != null && res.errors.length >= 1) {
        var err = res.errors[0];
        var errMsg = err.values.join('. ');

        res.responseMessage = errMsg;
      }

      return res;
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print('API client error ==> ${e.message}');
      return ApiClientResponse(responseMessage: 'Network error. Try again later.');
    }
  }



  Future<ApiClientResponse> refreshToken() async {
    try {
      var response = await dio.post('/auth/refresh_token',  options: optionsrefresh);
      return ApiClientResponse.fromJson(response.data);
    } on DioError catch (e) {
      return Future.error(_handleError(e));
    }
  }





}
