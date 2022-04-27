import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:flutter/material.dart';

class ConcludedRow extends StatelessWidget {
  final String question;
  final String desc;

  const ConcludedRow({
    Key? key,
    required this.question,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => AnswerScreen(
        //             name: 'Student Name',
        //             time: '04:00 PM to 04:30 PM     |     22 Jan 2022',
        //             isAnswered: true)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 103,
            width: 114,
            decoration: BoxDecoration(
              color: Color(0xFF33354E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 26,
                  width: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorPrimary),
                  child: Center(child: Text('Solved')),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  question,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      color: Color(0xFFA1A1A1)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
