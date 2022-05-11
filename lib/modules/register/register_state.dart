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

  // onSubmit(context) async {
  //   setLoading(true);
  //   if (formKey.currentState!.validate()) {
  //     var data = {
  //       "name": userName,
  //       "email": email,
  //       "password": password,
  //     };
  //     try {
  //       await dio.post("/teachers", data: data);
  //       ToastService().s("Account created successfully!");
  //       Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  //       // ignore: empty_catches
  //     } catch (err) {}
  //   }

  //   setLoading(false);
  // }

  String? token;

  onSubmit(context) async {
    setLoading(true);
    if (userName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        final result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        result.user!.sendEmailVerification();
        ToastService().s("Successfully registered!");
        LocalStorageService().write(LocalStorageKeys.userName, userName);
        LocalStorageService().write(LocalStorageKeys.email, email);
        Navigator.pop(context);
      } catch (err) {
        ToastService().e(err.toString());
      }
    } else {
      ToastService().w("Please provide all fields!");
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
      // await FirebaseAuth.instance.userChanges().listen((event) {
      //   if(event != null){
      //     FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      //   }
      // });
      if (FirebaseAuth.instance.currentUser != null) {
        final token = await FirebaseAuth.instance.currentUser!.getIdToken();
        this.token = token;
        notifyListeners();
      }
      onFinalSubmit(context);
      // ignore: empty_catches
    } catch (err) {}
  }

  // onFacebookSignup(context) async {
  //   try {
  //     final response = await FacebookAuth.instance.login(
  //       permissions: ["public_profile", "email"],
  //     );
  //     final result = await FacebookAuth.instance.getUserData();
  //     print(result);

  //     print("yo response ho $response");
  //   } catch (err) {
  //     print("yo error ho $err");
  //   }
  // }

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
