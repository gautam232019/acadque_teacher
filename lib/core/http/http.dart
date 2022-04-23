import 'dart:convert';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/main.dart';
import 'package:dio/dio.dart';

class CustomError extends DioError {
  String msg;
  CustomError(DioError error, this.msg)
      : super(
          requestOptions: error.requestOptions,
          error: error.error,
          response: error.response,
          type: error.type,
        );
}

class User {
  String? message;
  String? status;

  User(this.message, this.status);

  User.fromJson(dynamic json) {
    // return User(json['message'] as String, json['status'] as String);
    message = json['message'];
    status = json['status'];
  }
}

Dio getHttp() {
  Dio dio = Dio();

  dio.options.baseUrl = "https://api-acadque.herokuapp.com/api/v1/";
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      String token =
          LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
      if (token.isNotEmpty) {
        options.headers['token'] = token;
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
    onError: (DioError e, handler) {
      if (e.type == DioErrorType.response) {
        var kera = e.response.toString();
        User user = User.fromJson(jsonDecode(kera));
        final message = user.message!;
        if (message == "Token expired!") {
          navigatorKey.currentState!
              .pushNamedAndRemoveUntil('/login', (route) => false);
        }
        if (e.response!.statusCode == 401) {
          //Unauthorized
          LocalStorageService().clear(LocalStorageKeys.accessToken);
          Future.delayed(const Duration(milliseconds: 100), () {
            navigatorKey.currentState!
                .pushNamedAndRemoveUntil("/login", (route) => false);
          });
        }
      }
      String message = "Something went wrong";
      switch (e.type) {
        case DioErrorType.cancel:
          message = "Request Cancelled";
          break;
        case DioErrorType.response:
          if (e.response != null) {
            // var kera = e.response as Map<String, dynamic>;
            var kera = e.response.toString();
            User user = User.fromJson(jsonDecode(kera));
            message = user.message!;
          } else {
            message = "API didn't return JSON";
          }

          break;
        case DioErrorType.receiveTimeout:
          message = "Receive Timeout";
          break;
        case DioErrorType.sendTimeout:
          message = "Send Timeout";
          break;
        case DioErrorType.other:
          message = "Something went wrong";
          break;
        case DioErrorType.connectTimeout:
          message = "Connect Timeout";
          break;
      }
      ToastService().e(message);

      return handler.next(CustomError(e, message));
    },
  ));

  return dio;
}
