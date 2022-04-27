import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/tutor_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorHomeScreen extends StatelessWidget {
  const TutorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Alisha',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Roboto'),
                    ),
                    const Text(
                      'Thursday, 9th Sep 20',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NotificationScreen()));
                  },
                  child: SizedBox(
                    height: 24.92,
                    width: 22,
                    child: SvgPicture.asset(
                        'assets/svg/notification_icon_black.svg'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          const Text(
            'New Appointments',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
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
        ],
      ),
    );
  }
}
