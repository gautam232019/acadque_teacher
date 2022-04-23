import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/profile_row.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          fontFamily: 'Roboto'),
                    ),
                    SvgPicture.asset(
                      'assets/svg/notification_icon_black.svg',
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: state.loading
                    ? Column(
                        children: const [
                          lHeightSpan,
                          lHeightSpan,
                          lHeightSpan,
                          lHeightSpan,
                          CircularProgressIndicator(),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: 115,
                            width: 326,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/profile/image_thumbnail.svg',
                                      height: 110,
                                      width: 110,
                                      color: Colors.white,
                                    ),
                                    Positioned(
                                        top: 75,
                                        left: 40,
                                        child: SvgPicture.asset(
                                            'assets/svg/camera_icon.svg'))
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.teacherProfileState!.data!.teacher!
                                          .name!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Your Rate',
                                              style: TextStyle(
                                                  color: colorPrimary,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${state.teacherProfileState!.data!.teacher!.hourlyRate!.toString()}  / hr',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )),
                                    )
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF33354E),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 326,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xFFDBDBDB)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ProfileRow(
                                    iconPath:
                                        'assets/svg/profile/name_icon.svg',
                                    title: 'Name',
                                    value: state.teacherProfileState!.data!
                                        .teacher!.name!,
                                  ),
                                  DividerLine(),
                                  ProfileRow(
                                    iconPath:
                                        'assets/svg/profile/email_icon.svg',
                                    title: 'E-mail',
                                    value: state.teacherProfileState!.data!
                                        .teacher!.email!,
                                  ),
                                  DividerLine(),
                                  const ProfileRow(
                                    iconPath:
                                        'assets/svg/profile/password_icon.svg',
                                    title: 'Password',
                                    value: 'Updated 2 weeks ago',
                                  ),
                                  DividerLine(),
                                  const ProfileRow(
                                    iconPath:
                                        'assets/svg/profile/phone_icon.svg',
                                    title: 'Contact Number',
                                    value: "98156024409",
                                  ),
                                  DividerLine(),
                                  const ProfileRow(
                                    iconPath:
                                        'assets/svg/profile/subject_icon.svg',
                                    title: 'Your Speciality',
                                    value: 'Subject Name',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 93,
                                width: 93,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: colorBorder)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Image.asset('assets/images/slots.png'),
                                    const Text(
                                      'Available Slots',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 93,
                                width: 93,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: colorBorder)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Image.asset('assets/images/terms.png'),
                                    const Text(
                                      'Terms & Policy',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 93,
                                width: 93,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: colorBorder)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Image.asset('assets/images/info.png'),
                                    const Text(
                                      'About Us',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
