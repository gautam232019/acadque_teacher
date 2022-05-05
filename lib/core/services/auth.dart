import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  registerWithEmailPass(email, pass) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print(response);
      return response;
    } catch (err) {
      return null;
    }
  }
}
