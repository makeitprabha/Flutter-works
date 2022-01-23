import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_api/core/models/user_response.dart';

class UserApiProvider {
  final String _endpoint = "https://randomuser.me/api/";
  Dio _dio;
  int maxCharactersPerLine = 200;

  UserApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options);
    _setupLoggingInterceptor();
  }

  Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get(_endpoint);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError(_handleError(error));
    }
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${error.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

  void _setupLoggingInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          print("--> ${options.method} ${options.path}");
          print("Content type: ${options.contentType}");
          print("<-- END HTTP");
          return options;
        },
        onResponse: (Response response) async {
          print(
              "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
          String responseAsString = response.data.toString();
          if (responseAsString.length > maxCharactersPerLine) {
            int iterations =
                (responseAsString.length / maxCharactersPerLine).floor();
            for (int i = 0; i <= iterations; i++) {
              int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
              if (endingIndex > responseAsString.length) {
                endingIndex = responseAsString.length;
              }
              print(responseAsString.substring(
                  i * maxCharactersPerLine, endingIndex));
            }
          } else {
            print(response.data);
          }
          print("<-- END HTTP");
          return response; // continue
        },
        onError: (DioError e) async {
          print(e);
          return e; //continue
        },
      ),
    );
  }
}
