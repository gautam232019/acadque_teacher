import 'package:acadque_teacher/common/ui/concluded_row.dart';
import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/concluded/concluded_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConcludedScreen extends StatelessWidget {
  const ConcludedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ConcludedState>(context);
    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.answeredQuestionState?.data?.answers?.isEmpty ?? true
                ? const Center(
                    child: Text("No Questions"),
                  )
                : Padding(
                    padding: sPagePadding,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.answeredQuestionState!.data!.answers!
                            .map((e) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/answer_screen",
                                        arguments: {"id": e.questionId!.sId!});
                                  },
                                  child: Column(
                                    children: [
                                      ConcludedRow(
                                        question: e.questionId!.question!,
                                        desc: e.answer!,
                                      ),
                                      DividerLine(),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
      ),
    );
  }
}
