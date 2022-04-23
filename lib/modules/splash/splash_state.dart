import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';

class SplashState extends BaseState {
  Dio dio = getHttp();
  SplashState(context) {
    checkAndNavigate(context);
  }

  String? id;
  String? token;
  checkAndNavigate(context) async {
    try {
      String token =
          LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
      await Future.delayed(
        const Duration(seconds: 1),
      );

      if (token.isNotEmpty) {
        checkToken(context);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      // ignore: empty_catches
    } catch (err) {}
  }

  checkToken(context) async {
    token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
    notifyListeners();
    Map<String, dynamic> user = Jwt.parseJwt(token!);
    id = user["userId"] as String;
    notifyListeners();
    try {
      await dio.get('/teachers/$id');
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
      // ignore: empty_catches
    } catch (err) {
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }
  }
}
