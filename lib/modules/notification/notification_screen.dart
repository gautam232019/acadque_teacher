import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/modules/notification/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NotificationState>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 227,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.cover),
              ),
              child: const Center(
                child: Text(
                  "",
                  style: TextStyle(
                      color: Color(0xFF373737),
                      fontFamily: 'Roboto',
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lHeightSpan,
                lHeightSpan,
                Row(
                  children: [
                    lWidthSpan,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 40,
                        width: 40,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
                lHeightSpan,
                lHeightSpan,
                Row(
                  children: const [
                    lWidthSpan,
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                lHeightSpan,
                // Row(
                //   children: const [
                //     lWidthSpan,
                //     Text(
                //       "Today",
                //       style: TextStyle(
                //         fontSize: 12,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ],
                // ),
                mHeightSpan,
                lHeightSpan,
                Expanded(
                  child: Container(
                    child: state.loading
                        ? const Center(child: CircularProgressIndicator())
                        : state.notificationState?.data?.notifications
                                    ?.isEmpty ??
                                true
                            ? const Center(
                                child: Text("No notifications!"),
                              )
                            : Column(
                                children: state
                                    .notificationState!.data!.notifications!
                                    .map((e) {
                                  return Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          lWidthSpan,
                                          const CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            radius: 30,
                                          ),
                                          sWidthSpan,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                sHeightSpan,
                                                Row(
                                                  children: [
                                                    const Text(
                                                      "Admin",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    sWidthSpan,
                                                    Column(
                                                      children: [
                                                        sHeightSpan,
                                                        Text(
                                                          Jiffy(e.createdAt)
                                                              .fromNow(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                sHeightSpan,
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        e.message!,
                                                        overflow: TextOverflow
                                                            .visible,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  );
                                }).toList(),
                              ),
                  ),
                ),
                mHeightSpan,
              ],
            )
          ],
        ),
      ),
    );
  }
}
