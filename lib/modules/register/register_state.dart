import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RegisterState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

  bool hidePassword = true;

  changeVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  String userName = "";
  String email = "";
  String password = "";

  onUserNameChange(val) {
    userName = val;
    notifyListeners();
  }

  onEmailChange(val) {
    email = val;
    notifyListeners();
  }

  onPasswordChange(val) {
    password = val;
    notifyListeners();
  }

  onSubmit(context) async {
    setLoading(true);
    if (formKey.currentState!.validate()) {
      var data = {
        "name": userName,
        "email": email,
        "password": password,
      };
      try {
        await dio.post("/teachers", data: data);
        ToastService().s("Account created successfully!");
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        // ignore: empty_catches
      } catch (err) {}
    }

    setLoading(false);
  }
}
