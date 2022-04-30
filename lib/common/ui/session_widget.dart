// ignore_for_file: prefer_const_constructors,  prefer_const_literals_to_create_immutables

import 'package:acadque_teacher/common/ui/feedback_icon_widget.dart';
import 'package:acadque_teacher/common/ui/text_btn_widget.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:flutter/material.dart';

class SessionWidget extends StatelessWidget {
  final String name;
  final bool isAnswered;
  final String time;

  const SessionWidget(
      {Key? key,
      required this.isAnswered,
      required this.name,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Container(
            height: 163,
            width: 329,
            decoration: BoxDecoration(
              color: colorBox,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.play_arrow,
              color: Color(0xFFC4C4C4),
              size: 75,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            time,
            style: TextStyle(
              height: 1.5,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
              color: colorPrimary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.',
            style: TextStyle(fontSize: 12, fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: 120,
          ),
          isAnswered
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child:
                            FeedbackIconWidget(icon: 'unsatisfied', size: 32)),
                    GestureDetector(
                        onTap: () {},
                        child: FeedbackIconWidget(icon: 'neutral', size: 70)),
                    GestureDetector(
                        onTap: () {},
                        child: FeedbackIconWidget(icon: 'satisfied', size: 32)),
                    GestureDetector(
                        onTap: () {},
                        child: FeedbackIconWidget(
                            icon: 'verysatisfied', size: 32)),
                  ],
                )
              : TextButtonWidget(value: 'Start Session'),
        ],
      ),
    );
  }
}
