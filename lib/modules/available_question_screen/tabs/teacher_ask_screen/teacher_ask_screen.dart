import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherAskScreen extends StatelessWidget {
  const TeacherAskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("This is teacher ask screen"),
      ),
    );
  }
}
