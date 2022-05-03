import 'package:acadque_teacher/common/constrants/app_theme.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/modules/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterState>(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: state.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              color: Color(0xFF373737),
                              fontFamily: 'Roboto',
                              fontSize: 32,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                      onChanged: state.onUserNameChange,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter username!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                      onChanged: state.onEmailChange,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter email!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
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
                          labelText: "Create Password",
                          hintText: '',
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          labelStyle: const TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    state.onSubmit(context);
                  },
                  child: Container(
                    height: 48,
                    width: 327,
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
                              'CREATE ACCOUNT',
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
                  "or Sign Up With",
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
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFF3F3F3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      "Already a User?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF919191)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 48,
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Center(
                                child: Text(
                                  'Login',
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
      ),
    );
  }
}
