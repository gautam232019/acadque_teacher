import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/concluded/concluded_screen.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/concluded/concluded_state.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/earning/earning_screen.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/earning/earning_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: 327,
              height: 45,
              decoration: BoxDecoration(
                color: colorWhite,
                border: Border.all(color: colorPrimary, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                  labelColor: colorWhite,
                  unselectedLabelColor: colorPrimary,
                  indicator: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(30)),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Satisfied Answers',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      // text: 'Available Questions',
                    ),
                    Tab(
                      child: Text(
                        'Earnings',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ChangeNotifierProvider(
                    create: (_) => ConcludedState(),
                    child: const ConcludedScreen(),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => EarningState(),
                    child: const EarningScreen(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
