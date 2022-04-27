import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/tutor_profile.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          TutorProfile(
            isCompleted: false,
            name: 'Name 1',
          ),
          DividerLine(),
          TutorProfile(
            isCompleted: false,
            name: 'Name 2',
          ),
          DividerLine(),
          TutorProfile(
            isCompleted: false,
            name: 'Name 3',
          ),
        ],
      ),
    );
  }
}
