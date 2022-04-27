import 'package:acadque_teacher/common/ui/concluded_row.dart';
import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:flutter/cupertino.dart';

class ConcludedScreen extends StatelessWidget {
  const ConcludedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ConcludedRow(
              question:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt?',
              desc:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
          DividerLine(),
          ConcludedRow(
              question:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt?',
              desc:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
          DividerLine(),
          ConcludedRow(
              question:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt?',
              desc:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
          DividerLine(),
          ConcludedRow(
              question:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt?',
              desc:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
          DividerLine(),
        ],
      ),
    );
  }
}
