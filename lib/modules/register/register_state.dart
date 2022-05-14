import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool hidePassword = true;
  bool hideVerifyPassword = true;

  changeVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  changeVerifyPasswordVisibility() {
    hideVerifyPassword = !hideVerifyPassword;
    notifyListeners();
  }

  String userName = "";
  String email = "";
  String password = "";

  onUserNameChange(val) {
    userName = val;
    notifyListeners();
  }

  String verifyPassword = "";

  onVerifyPasswordChange(val) {
    verifyPassword = val;
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

  String? token;

  onSubmit(context) async {
    setLoading(true);
    if (formKey.currentState!.validate()) {
      try {
        final result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.replaceAll(' ', ''),
          password: password.replaceAll(' ', ''),
        );
        result.user!.sendEmailVerification();
        ToastService().s("Successfully registered!");
        LocalStorageService().write(LocalStorageKeys.userName, userName);
        LocalStorageService().write(LocalStorageKeys.email, email);
        Navigator.pop(context);
      } on FirebaseAuthException catch (err) {
        ToastService().e(err.message!);
      }
    } else {
      ToastService().w(
          "Please validate all fields and Password must contain uppercase, lowercase, number and character!");
    }
    setLoading(false);
  }

  onGoogleSignup(context) async {
    try {
      final response = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await response!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (FirebaseAuth.instance.currentUser != null) {
        final token = await FirebaseAuth.instance.currentUser!.getIdToken();
        this.token = token;
        notifyListeners();
      }
      onFinalSubmit(context);
      // ignore: empty_catches
    } catch (err) {}
  }

  onFinalSubmit(context) async {
    try {
      final response = await dio
          .get("/auth/provider?user=teacher&provider=google&idToken=$token");
      LocalStorageService()
          .write(LocalStorageKeys.accessToken, response.data["data"]);
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
      setLoading(false);
      // ignore: empty_catches
    } catch (err) {
      setLoading(false);
    }
  }
}
