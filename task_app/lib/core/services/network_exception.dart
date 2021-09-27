import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taskapp/core/services/dio_error.dart';

class NetworkException {
  DioCustomizeError handleError(DioError error) {
    DioCustomizeError statusError = DioCustomizeError();
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.other:
              statusError.message = "No network connection available.";
              break;
            case DioErrorType.cancel:
              statusError = DioCustomizeError.fromJson(error.response!.data);
              break;
            case DioErrorType.connectTimeout:
              statusError = DioCustomizeError.fromJson(error.response!.data);
              break;
            case DioErrorType.receiveTimeout:
              statusError = DioCustomizeError.fromJson(error.response!.data);
              break;
            case DioErrorType.response:
              statusError = DioCustomizeError.fromJson(error.response!.data);
              break;
            case DioErrorType.sendTimeout:
              statusError = DioCustomizeError.fromJson(error.response!.data);
              break;
          }
          return statusError;
        } else if (error is SocketException) {
          statusError.message = "No network connection available.";
          return statusError;
        } else {
          statusError.message = "Unable to process your request at the moment.";
          return statusError;
        }
      } on FormatException catch (_) {
        statusError.message = "Unable to process your request at the moment.";
        return statusError;
      } catch (e) {
        statusError.message = "Unable to process your request at the moment.";
        return statusError;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        statusError.message = "Unable to process your request at the moment.";
        return statusError;
      } else {
        statusError.message = "Unable to process your request at the moment.";
        return statusError;
      }
    }
  }
}
