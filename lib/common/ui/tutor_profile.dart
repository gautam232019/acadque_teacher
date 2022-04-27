import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:flutter/material.dart';

class TutorProfile extends StatelessWidget {
  final bool isCompleted;
  final String name;

  const TutorProfile({Key? key, required this.isCompleted, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => AnswerScreen(
        //             name: name,
        //             time: '04:00 PM to 04:30 PM     |     22 Jan 2022',
        //             isAnswered: isCompleted)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF33354E),
                    borderRadius: BorderRadius.circular(8)),
                height: 72,
                width: 84,
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '30 Mins Session',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFA1A1A1),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '04:00 PM to 04:30 PM',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: colorPrimary),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: colorPrimary),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('22 Jan 2022',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: colorPrimary))
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
