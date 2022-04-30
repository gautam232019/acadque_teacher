import 'package:acadque_teacher/common/ui/feedback_icon_widget.dart';
import 'package:acadque_teacher/common/ui/text_btn_widget.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/appointment_detail/appointment_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class AppointmentDetailScreen extends StatelessWidget {
  const AppointmentDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppointmentDetailState>(context);

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
                            'Your Appointment',
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
                          fit: BoxFit.cover),
                    ),
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
                            bottomRight: Radius.zero),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ListView(
                            children: [
                              if (state.appointmentState!.data!.appointment!
                                  .studentId!.profileURL!.isNotEmpty)
                                Container(
                                  height: 163,
                                  width: 329,
                                  decoration: BoxDecoration(
                                    color: colorBox,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.network(state
                                      .appointmentState!
                                      .data!
                                      .appointment!
                                      .studentId!
                                      .profileURL!),
                                )
                              else
                                Container(
                                  height: 163,
                                  width: 329,
                                  decoration: BoxDecoration(
                                    color: colorBox,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                state
                                    .appointmentState!.data!.appointment!.type!,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                Jiffy(state.appointmentState!.data!.appointment!
                                        .createdAt!)
                                    .fromNow(),
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: colorPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Student Name: ${state.appointmentState!.data!.appointment!.studentId!.name!}"),
                              sHeightSpan,
                              Text(
                                  "Status: ${state.appointmentState!.data!.appointment!.status}"),
                              sHeightSpan,
                              Text(
                                  "Duration: ${state.appointmentState!.data!.appointment!.duration} mins"),
                              sHeightSpan,
                              // const Text(
                              //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.',
                              //   style: TextStyle(
                              //       fontSize: 12, fontFamily: 'Roboto'),
                              // ),
                              const SizedBox(
                                height: 120,
                              ),
                              state.appointmentState!.data!.appointment!
                                          .status ==
                                      "completed"
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
                                                icon: 'neutral', size: 70)),
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
                                  : const TextButtonWidget(
                                      value: 'Start Session'),
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
