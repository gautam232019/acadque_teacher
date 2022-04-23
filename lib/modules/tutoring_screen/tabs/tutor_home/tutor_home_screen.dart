import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorHomeScreen extends StatelessWidget {
  const TutorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("This is tutor home screen"),
      ),
    );
  }
}
