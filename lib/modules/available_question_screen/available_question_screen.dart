import 'package:acadque_teacher/modules/available_question_screen/available_question_state.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/available_question_home_screen.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/available_question_home_state.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/teacher_ask_screen/teacher_ask_screen.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/teacher_ask_screen/teacher_ask_state.dart';
import 'package:acadque_teacher/modules/profile/profile_screen.dart';
import 'package:acadque_teacher/modules/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AvailableQuestionScreen extends StatelessWidget {
  const AvailableQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AvailableQuestionState>(context);

    int selectedIndex = 0;
    var tabs = [
      ChangeNotifierProvider(
        create: (_) => AvailableQuestionHomeState(),
        child: const AvailableQuestionHomeScreen(),
      ),
      ChangeNotifierProvider(
        create: (_) => TeacherAskState(),
        child: const TeacherAskScreen(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProfileState(),
        child: const ProfileScreen(),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(child: CircularProgressIndicator())
            : tabs.elementAt(state.bottomIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              border: Border.all(color: const Color(0XFFEBEBEB))),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/svg/bottom_nav/home.svg',
                      color: state.bottomIndex == 0
                          ? const Color(0xFF59AEFD)
                          : const Color(0xFFA6A6A6),
                    ),
                  ),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/svg/bottom_nav/book.svg',
                      color: state.bottomIndex == 1
                          ? const Color(0xFF59AEFD)
                          : const Color(0xFFA6A6A6),
                    ),
                  ),
                  label: "ask",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/svg/person.svg',
                      color: state.bottomIndex == 2
                          ? const Color(0xFF59AEFD)
                          : const Color(0xFFA6A6A6),
                    ),
                  ),
                  label: "profile",
                ),
              ],
              currentIndex: selectedIndex,
              onTap: (index) {
                state.onBottomItemTapped(index, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
