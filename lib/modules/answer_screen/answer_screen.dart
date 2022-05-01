import 'package:acadque_teacher/common/ui/feedback_icon_widget.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/answer_screen/answer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AnswerState>(context);
    final size = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    'assets/svg/arrow_back.svg'),
                              )),
                          const Text(
                            'Your Questions',
                            style: TextStyle(
                                fontSize: 20,
                                color: colorWhite,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto'),
                          ),
                          const Text('')
                        ],
                      ),
                    ),
                    height: size * 0.2,
                    decoration: const BoxDecoration(
                        color: Color(0xFF59AEFD),
                        image: DecorationImage(
                            image: AssetImage('assets/images/bg_dark.png'),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ListView(
                            children: [
                              if (state.singleQuestionState!.data!.question!
                                  .first.mediaUrl!.isNotEmpty)
                                Container(
                                  child: Image.network(state
                                      .singleQuestionState!
                                      .data!
                                      .question!
                                      .first
                                      .mediaUrl!),
                                  height: 163,
                                  width: 329,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                )
                              else
                                Container(
                                  height: 163,
                                  width: 329,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: colorBox,
                                  ),
                                ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                state.singleQuestionState!.data!.question!.first
                                    .question!,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              if (state.singleQuestionState!.data!.question!
                                      .first.solved ==
                                  false)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Post Your Answer',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 327,
                                      height: 138,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: colorGrey,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            TextField(
                                              onChanged: state.onAnswerChange,
                                              maxLines: 6,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Write here...',
                                                hintStyle: TextStyle(
                                                    color: colorGreyLight,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: state
                                                          .singleQuestionState!
                                                          .data!
                                                          .question!
                                                          .first
                                                          .solved ==
                                                      true
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                          color: colorPrimary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SvgPicture.asset(
                                                          'assets/svg/pencil.svg',
                                                          color: colorWhite,
                                                        ),
                                                      ),
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/svg/pencil.svg',
                                                      color: colorGrey,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Answer',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto'),
                                    ),
                                    sHeightSpan,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            state
                                                .singleQuestionState!
                                                .data!
                                                .question!
                                                .first
                                                .answers!
                                                .first
                                                .answer!,
                                            overflow: TextOverflow.visible,
                                            style: const TextStyle(
                                              height: 1.5,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              state.singleQuestionState!.data!.question!.first
                                          .solved ==
                                      true
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                            onTap: () {},
                                            child: const FeedbackIconWidget(
                                                icon: 'unsatisfied', size: 32)),
                                        GestureDetector(
                                            onTap: () {},
                                            child: const FeedbackIconWidget(
                                                icon: 'neutral', size: 32)),
                                        GestureDetector(
                                            onTap: () {},
                                            child: const FeedbackIconWidget(
                                                icon: 'satisfied', size: 32)),
                                        GestureDetector(
                                            onTap: () {},
                                            child: const FeedbackIconWidget(
                                                icon: 'verysatisfied',
                                                size: 32)),
                                      ],
                                    )
                                  : InkWell(
                                      onTap: () {
                                        state.onAnswerSubmit(context);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 327,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          color: colorPrimary,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (state.submitLoading)
                                                const CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              sWidthSpan,
                                              const Text(
                                                "Post",
                                                style: TextStyle(
                                                    color: colorWhite,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
