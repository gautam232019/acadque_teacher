import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/tutor_profile.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/tutor_home/tutor_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class TutorHomeScreen extends StatelessWidget {
  const TutorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TutorHomeState>(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            state.teacherProfileState!.data!.teacher!.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Roboto'),
                          ),
                          sHeightSpan,
                          Text(
                            Jiffy(DateTime.now()).format("EEEE, do MMM yyyy"),
                            style: const TextStyle(
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
                Expanded(
                  child: state.appointmentLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.teacherAppointmentState?.data?.appointments
                                  ?.isEmpty ??
                              true
                          ? const Center(
                              child: Text("No Appointments"),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: state.teacherAppointmentState!.data!
                                    .appointments!
                                    .map(
                                      (e) => Column(
                                        children: const [
                                          TutorProfile(
                                              isCompleted: true, name: "kera"),
                                          mHeightSpan,
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                ),
              ],
            ),
    );
  }
}

//  TutorProfile(
//                         isCompleted: false,
//                         name: 'Name 1',
//                       ),
//                       DividerLine(),
//                       TutorProfile(
//                         isCompleted: false,
//                         name: 'Name 2',
//                       ),
//                       DividerLine(),
//                       TutorProfile(
//                         isCompleted: false,
//                         name: 'Name 3',
//                       ),
