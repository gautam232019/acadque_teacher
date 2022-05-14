import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState extends BaseState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Dio dio = getHttp();

  bool hidePassword = true;

  changeVisibility() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  String userName = "";
  String password = "";

  onUserNameChange(val) {
    userName = val;
    notifyListeners();
  }

  onPasswordChange(val) {
    password = val;
    notifyListeners();
  }

  String? token;
  onSubmit(context) async {
    if (formKey.currentState!.validate()) {
      setLoading(true);
      try {
        final finalEmail = userName.replaceAll(' ', '');
        final response = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: finalEmail, password: password);
        if (FirebaseAuth.instance.currentUser != null) {
          final token = await FirebaseAuth.instance.currentUser!.getIdToken();
          this.token = token;
          notifyListeners();
        }
        if (response.user!.emailVerified == false) {
          response.user!.sendEmailVerification();
          ToastService().w("Please verify your email!");
          setLoading(false);
          return;
        }
        if (FirebaseAuth.instance.currentUser != null) {
          final token = await FirebaseAuth.instance.currentUser!.getIdToken();
          this.token = token;
          notifyListeners();
        }
        onFinalNativeSubmit(context);
        // ignore: empty_catches
      } on FirebaseAuthException catch (err) {
        ToastService().e(err.message!);
        setLoading(false);
      }
    }
  }

  onFinalNativeSubmit(context) async {
    try {
      final finalEmail = userName.replaceAll(' ', '');
      String? name = LocalStorageService().read(LocalStorageKeys.userName);

      String? storedEmail = LocalStorageService().read(LocalStorageKeys.email);
      if (storedEmail?.replaceAll(' ', '') == finalEmail.replaceAll(' ', '')) {
        final response = await dio.get(
            "/auth/provider?user=teacher&provider=password&idToken=$token&name=$name");
        LocalStorageService()
            .write(LocalStorageKeys.accessToken, response.data["data"]);
        LocalStorageService().write(LocalStorageKeys.isNaviveProvider, "Yes");
        Navigator.pushNamedAndRemoveUntil(
            context, '/welcome', (route) => false);
      } else {
        final response = await dio.get(
            "/auth/provider?user=teacher&provider=password&idToken=$token");
        LocalStorageService()
            .write(LocalStorageKeys.accessToken, response.data["data"]);
        LocalStorageService().write(LocalStorageKeys.isNaviveProvider, "Yes");
        Navigator.pushNamedAndRemoveUntil(
            context, '/welcome', (route) => false);
      }
      setLoading(false);
      // ignore: empty_catches
    } on DioError catch (err) {
      setLoading(false);
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
      final finalEmail = userName.replaceAll(' ', '');
      String? name = LocalStorageService().read(LocalStorageKeys.userName);
      String? storedEmail = LocalStorageService().read(LocalStorageKeys.email);
      if (storedEmail == finalEmail) {
        final response = await dio.get(
            "/auth/provider?user=teacher&provider=google&idToken=$token&name=$name");
        LocalStorageService()
            .write(LocalStorageKeys.accessToken, response.data["data"]);
        Navigator.pushNamedAndRemoveUntil(
            context, '/welcome', (route) => false);
      } else {
        final response = await dio
            .get("/auth/provider?user=teacher&provider=google&idToken=$token");
        LocalStorageService()
            .write(LocalStorageKeys.accessToken, response.data["data"]);
        Navigator.pushNamedAndRemoveUntil(
            context, '/welcome', (route) => false);
      }
      setLoading(false);
      // ignore: empty_catches, unused_catch_clause
    } on DioError catch (err) {
      setLoading(false);
    }
  }
}
