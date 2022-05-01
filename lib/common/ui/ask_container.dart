import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class AskContainer extends StatelessWidget {
  final bool isSolved;
  final String question;
  final String desc;

  const AskContainer({
    Key? key,
    required this.isSolved,
    required this.question,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 103,
            width: 114,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF59AEFD),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(isSolved == true ? 'Completed' : 'Pending'),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF33354E),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                sHeightSpan,
                Text(
                  question,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto',
                    color: Color(0xFFA1A1A1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
