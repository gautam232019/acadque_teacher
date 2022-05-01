import 'package:acadque_teacher/common/constrants/app_theme.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/tabs/inside_available_question/inside_question_screen.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/tabs/inside_available_question/inside_question_state.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/tabs/inside_available_question_history/inside_question_history_screen.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/tabs/inside_available_question_history/inside_question_history_state.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/concluded/concluded_screen.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/concluded/concluded_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AvailableQuestionHomeScreen extends StatelessWidget {
  const AvailableQuestionHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SvgPicture.asset('assets/svg/arrow_back.svg'),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: colorWhite, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      width: 270,
                      child: TabBar(
                        labelColor: colorPrimary,
                        unselectedLabelColor: colorWhite,
                        indicator: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(8)),
                        // labelStyle: TextStyle(color: colorPrimary),
                        tabs: const [
                          Tab(
                            child: Text(
                              'Available Questions',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            // text: 'Available Questions',
                          ),
                          Tab(
                            child: Text(
                              'History',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/svg/notification_icon.svg'),
                  ],
                ),
              ),
              height: size * 0.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_dark.png'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TabBarView(children: [
                    ChangeNotifierProvider(
                      create: (_) => InsideQuestionState(),
                      child: const InsideQuestionScreen(),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => ConcludedState(),
                      child: const ConcludedScreen(),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
