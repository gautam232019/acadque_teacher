import 'package:acadque_teacher/common/constrants/app_theme.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/modules/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height: 227,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xFF373737),
                          fontFamily: 'Roboto',
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Form(
                  key: state.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 60, left: 30, right: 30, bottom: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: state.onUserNameChange,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter username or email!";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Username or Email",
                            hintText: '',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17.5,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: state.hidePassword,
                          onChanged: state.onPasswordChange,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter password!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: state.hidePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onTap: state.changeVisibility,
                            ),
                            labelText: "Password",
                            hintText: '',
                            hintStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17.5,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                            labelStyle: const TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            state.onSubmit(context);
                          },
                          child: Container(
                            height: 48,
                            width: 263,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (state.loading)
                                      const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    sWidthSpan,
                                    const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or Login With",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                state.onGoogleSignup(context);
                              },
                              child: Container(
                                height: 48,
                                width: 126,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFFF3F3F3),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/google.svg',
                                      height: 24.8,
                                      width: 24.2,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Center(
                                        child: Text(
                                          'Google',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 48,
                                width: 126,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFFF3F3F3),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/facebook.svg',
                                      height: 24.8,
                                      width: 24.2,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Center(
                                        child: Text(
                                          'Facebook',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "New User?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF919191)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: SizedBox(
                                height: 48,
                                width: 126,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Center(
                                        child: Text(
                                          'Sign Up Now',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1F5567),
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
