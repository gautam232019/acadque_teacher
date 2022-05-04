import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/sessions/sessions_state.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SessionsState>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : state.teacherAppointmentState?.data?.appointments?.isEmpty ?? true
              ? const Center(
                  child: Text("No Appointments"),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: state.teacherAppointmentState!.data!.appointments!
                        .map((e) {
                      if (e.status != "completed") {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/appointment_detail",
                                    arguments: {"id": e.sId!});
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF33354E),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        height: 72,
                                        width: 84,
                                        child: e.studentId!.profileURL != null
                                            ? Image.network(
                                                e.studentId!.profileURL!,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              )
                                            : null,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            " ${e.duration!.toString()} Mins Session",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            e.type!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFFA1A1A1),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${Jiffy(e.from).format("hh:mm a")} to ${Jiffy(e.to!).format("hh:mm a")}",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: colorPrimary),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              const Text(
                                                '|',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: colorPrimary),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                  Jiffy(e.from)
                                                      .format("dd MMM yyyy"),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: colorPrimary))
                                            ],
                                          ),
                                          Text("Status: ${e.status!}")
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            mHeightSpan,
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }).toList(),
                  ),
                ),
    );
  }
}
