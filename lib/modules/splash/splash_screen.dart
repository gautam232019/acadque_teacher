import 'package:acadque_teacher/modules/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final state = Provider.of<SplashState>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top.png',
                fit: BoxFit.cover,
              ),
              width: size.width,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/down.png',
                fit: BoxFit.cover,
              ),
              width: size.width,
            ),
            Center(
              child: Image.asset('assets/images/logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
