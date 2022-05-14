import 'package:acadque_teacher/common/ui/ask_container.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/tabs/inside_available_question/inside_question_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsideQuestionScreen extends StatelessWidget {
  const InsideQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<InsideQuestionState>(context);

    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: sPagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   'Select Category',
                    //   style:
                    //       TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Container(
                    //   height: 50,
                    //   width: 327,
                    //   padding: const EdgeInsets.all(12),
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFFF9F9F9),
                    //       borderRadius: BorderRadius.circular(12),
                    //       border: Border.all(color: const Color(0xFFF9F9F9))),
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton(
                    //       isExpanded: true,
                    //       value: state.subject,
                    //       hint: const Text("Select subject"),
                    //       items: state.subjectState!.data!.subjects!
                    //           .map(
                    //             (e) => DropdownMenuItem(
                    //               child: Text(e.name!),
                    //               value: e.sId!,
                    //             ),
                    //           )
                    //           .toList(),
                    //       onChanged: (val) {
                    //         state.onSubjectChange(val);
                    //       },
                    //       iconSize: 40,
                    //       icon: const Icon(
                    //         Icons.arrow_drop_down,
                    //         color: colorBox,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    if (state.studentQuestionsState!.data!.questions!.isEmpty)
                      const Expanded(
                        child: Center(
                          child: Text("No Questions!"),
                        ),
                      )
                    else
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state
                                .studentQuestionsState!.data!.questions!
                                .map((e) {
                              return InkWell(
                                onTap: () async {
                                  // AnswerScreen mah jane
                                  final response = await Navigator.pushNamed(
                                      context, "/answer_screen",
                                      arguments: {
                                        "id": e.sId,
                                      });
                                  if (response != null) {
                                    state.fetchStudentQuestions();
                                  }
                                },
                                child: AskContainer(
                                    isSolved: e.solved!,
                                    question: e.question!,
                                    desc: ""),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                  ],
                ),
              ),
      ),
    );
  }
}
