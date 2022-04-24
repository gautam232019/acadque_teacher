// ignore_for_file: prefer_const_constructors

import 'package:acadque_teacher/common/constrants/app_theme.dart';
import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/profile_row.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

final multiSelectKey = GlobalKey<FormFieldState>();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);

    onTextEdit(String field, String value) {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    initialValue: value,
                    onChanged: (val) {
                      state.onChange(field, val);
                    },
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text(field.toUpperCase()),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.5,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                      labelStyle: const TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onSubmit(field);
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    onSubjectEdit(String field, String value) {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    field.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sHeightSpan,
                  // MultiSelectDialogField(
                  //   key: multiSelectKey,
                  //   buttonIcon: const Icon(
                  //     Icons.arrow_drop_down,
                  //     color: darkGrey,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: darkGrey),
                  //   ),
                  //   selectedColor: primaryColor,
                  //   selectedItemsTextStyle: TextStyle(
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  //   itemsTextStyle: TextStyle(fontSize: 10),
                  //   items: item.possibleValues!.map((value) {
                  //     return MultiSelectItem(value, value);
                  //   }).toList(),
                  //   listType: MultiSelectListType.CHIP,
                  //   searchable: true,
                  //   initialValue: state.form['${item.field}'],
                  //   onConfirm: (values) {
                  //     state.onChange(item.field!, values.toList());
                  //   },
                  //   chipDisplay: MultiSelectChipDisplay(),
                  //   buttonText: Text(
                  //     'Select ${item.display!}',
                  //     style: const TextStyle(
                  //       fontSize: 12,
                  //       color: darkGrey,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onSubmit(field);
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

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
              Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                sHeightSpan,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      "Choose one",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(),
                                                sHeightSpan,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        state.pickFromCamera(
                                                            context);
                                                      },
                                                      child: const Icon(
                                                        Icons.camera,
                                                        size: 80,
                                                      ),
                                                    ),
                                                    sWidthSpan,
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        state.pickFromGallery(
                                                            context);
                                                      },
                                                      child: const Icon(
                                                        Icons.photo_album,
                                                        size: 80,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Stack(
                                    children: [
                                      if (state.teacherProfileState!.data!
                                          .teacher!.profileURL!.isNotEmpty)
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              state.teacherProfileState!.data!
                                                  .teacher!.profileURL!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.transparent,
                                          ),
                                        )
                                      else
                                        SvgPicture.asset(
                                          'assets/svg/profile/image_thumbnail.svg',
                                          height: 110,
                                          width: 110,
                                          color: Colors.white,
                                        ),
                                      Positioned(
                                        top: 52,
                                        left: 25,
                                        child: SvgPicture.asset(
                                            'assets/svg/camera_icon.svg'),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    InkWell(
                                      onTap: () {
                                        state.onChange(
                                            'hourlyRate',
                                            state.teacherProfileState!.data!
                                                .teacher!.hourlyRate!
                                                .toString());
                                        onTextEdit(
                                            'hourlyRate',
                                            state.teacherProfileState!.data!
                                                .teacher!.hourlyRate!
                                                .toString());
                                      },
                                      child: Container(
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
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
                                  InkWell(
                                    onTap: () {
                                      state.onChange(
                                          'name',
                                          state.teacherProfileState!.data!
                                              .teacher!.name!);
                                      onTextEdit(
                                          'name',
                                          state.teacherProfileState!.data!
                                              .teacher!.name!);
                                    },
                                    child: ProfileRow(
                                      iconPath:
                                          'assets/svg/profile/name_icon.svg',
                                      title: 'Name',
                                      value: state.teacherProfileState!.data!
                                          .teacher!.name!,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      "assets/svg/profile/subject_icon.svg"),
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
