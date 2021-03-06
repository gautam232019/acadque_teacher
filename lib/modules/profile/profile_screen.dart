// ignore_for_file: prefer_const_constructors

import 'package:acadque_teacher/common/constrants/app_theme.dart';
import 'package:acadque_teacher/common/ui/divider_line.dart';
import 'package:acadque_teacher/common/ui/profile_row.dart';
import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/modules/profile/models/teacher_profile_response.dart';
import 'package:acadque_teacher/modules/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    showTwitterAddModel() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Twitter Link'),
            content: SingleChildScrollView(
              child: Form(
                key: state.twitterKey,
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      onChanged: state.onTwitterlinkChange,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please provide twitter link!";
                        } else if (RegExp(
                                    "http(?:s)?:\\/\\/(?:www\\.)?twitter\\.com\\/([a-zA-Z0-9_]+)")
                                .hasMatch(val) ==
                            false) {
                          return "Please add valid twitter link!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: '',
                        label: Text("Twitter link"),
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
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onTwitterLinkSubmit(context);
                },
              ),
            ],
          );
        },
      );
    }

    showTwitterRemoveModel() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                const Text('Are you sure you want to remove your twitter url?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed: () {
                  state.onTwitterLinkRemove(context);
                },
              ),
            ],
          );
        },
      );
    }

    onHourlyEdit(String field, String value) {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit Hourly Rate'),
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

    onEmailEdit() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Email update'),
            content: SingleChildScrollView(
              child: Form(
                key: state.emailFormKey,
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        state.onNewEmailChange(val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter email!";
                        } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val) ==
                            false) {
                          return "Plesae enter valid email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: '',
                        label: Text("EMAIL"),
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17.5,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onNewEmailUpdateSubmit(context);
                  // Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    onPasswordEdit() {
      return showDialog<bool>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Password Change'),
            content: SingleChildScrollView(
              child: Form(
                key: state.formKey,
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        state.onOldPasswordChange(val);
                      },
                      decoration: const InputDecoration(
                        hintText: '',
                        label: Text("Old password"),
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17.5,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    xsHeightSpan,
                    TextFormField(
                      onChanged: (val) {
                        state.onNewPasswordChange(val);
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter password!";
                        } else if (RegExp(
                                    "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W)")
                                .hasMatch(val) ==
                            false) {
                          return "Please is week!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: '',
                        label: Text("New password"),
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17.5,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onPasswordUpdate(context);
                },
              ),
            ],
          );
        },
      );
    }

    onContactEdit() {
      return showDialog<bool>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return StatefulBuilder(builder: ((context, setState) {
              return AlertDialog(
                title: const Text('Contact update'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) {
                          state.onContactChange(val);
                        },
                        decoration: const InputDecoration(
                          hintText: '',
                          label: Text("Phone Number"),
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17.5,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              color: Color(0xFFA1A1A1),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      if (state.contactUpdateLoading == true)
                        const SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      xsHeightSpan,
                      SizedBox(
                        child: TextFormField(
                          onChanged: (val) {
                            state.onCodeSmsChange(val);
                          },
                          decoration: const InputDecoration(
                            hintText: '',
                            label: Text("OTP"),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17.5,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      // if (state.contactUpdateLoading == true)
                      //   const CircularProgressIndicator()
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text("Get Otp"),
                    onPressed: () {
                      state.sendOtp();
                      // Navigator.of(context).pop(true);
                    },
                  ),
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      state.onContactUpdateSubmit(context);
                      // Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            }));
          });
    }

    onSubjectEdit(String field, List<Subjects> value) {
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
                  MultiSelectDialogField(
                    key: multiSelectKey,
                    buttonIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: darkGrey,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: darkGrey),
                    ),
                    selectedColor: primaryColor,
                    selectedItemsTextStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    itemsTextStyle: TextStyle(fontSize: 10),
                    items: state.subjectState!.data!.subjects!.map((value) {
                      return MultiSelectItem(value.sId, value.name!);
                    }).toList(),
                    listType: MultiSelectListType.CHIP,
                    searchable: true,
                    initialValue: state.form[field],
                    onConfirm: (values) {
                      state.onChange(field, values.toList());
                    },
                    chipDisplay: MultiSelectChipDisplay(),
                    buttonText: Text(
                      'Select subjects',
                      style: const TextStyle(
                        fontSize: 12,
                        color: darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  state.onSubjectEdit();
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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/notification");
                      },
                      child: SvgPicture.asset(
                        'assets/svg/notification_icon_black.svg',
                      ),
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
                                                      "Choose Profile",
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
                                      if (state.teacherProfileState!.data!
                                          .teacher!.profileURL!.isNotEmpty)
                                        Positioned(
                                          top: 52,
                                          left: 25,
                                          child: SvgPicture.asset(
                                              'assets/svg/camera_icon.svg'),
                                        )
                                      else
                                        Positioned(
                                          top: 62,
                                          left: 35,
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
                                        onHourlyEdit(
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
                                                'Rs ${state.teacherProfileState!.data!.teacher!.hourlyRate!.toString()} / hr',
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
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      final result = LocalStorageService().read(
                                          LocalStorageKeys.isNaviveProvider);
                                      if (result != null) {
                                        onEmailEdit();
                                      }
                                    },
                                    child: ProfileRow(
                                      iconPath:
                                          'assets/svg/profile/email_icon.svg',
                                      title: 'E-mail',
                                      value: state.teacherProfileState!.data!
                                          .teacher!.email!,
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      final result = LocalStorageService().read(
                                          LocalStorageKeys.isNaviveProvider);
                                      if (result != null) {
                                        onPasswordEdit();
                                      }
                                    },
                                    child: const ProfileRow(
                                      iconPath:
                                          'assets/svg/profile/password_icon.svg',
                                      title: 'Password',
                                      value: '********',
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      onContactEdit();
                                    },
                                    child: ProfileRow(
                                      iconPath: 'assets/svg/contact_icon.svg',
                                      title: 'Contact Number',
                                      value: state.teacherProfileState?.data
                                              ?.teacher?.contact ??
                                          "N/A",
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      onSubjectEdit(
                                          'subjects',
                                          state.teacherProfileState!.data!
                                              .teacher!.subjects!);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/svg/profile/subject_icon.svg"),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Your Speciality",
                                                  style: TextStyle(
                                                    color: Color(0xFFA1A1A1),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                                if (state
                                                    .teacherProfileState!
                                                    .data!
                                                    .teacher!
                                                    .subjects!
                                                    .isNotEmpty)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: state
                                                        .teacherProfileState!
                                                        .data!
                                                        .teacher!
                                                        .subjects!
                                                        .map((e) => Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(e
                                                                        .name!),
                                                                  ],
                                                                ),
                                                              ],
                                                            ))
                                                        .toList(),
                                                  )
                                                else
                                                  Text(
                                                    "No Subjects",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  )
                                              ],
                                            )
                                          ],
                                        ),
                                        SvgPicture.asset(
                                          'assets/svg/arrow_front.svg',
                                          color: colorBox,
                                        )
                                      ],
                                    ),
                                  ),
                                  DividerLine(),
                                  InkWell(
                                    onTap: () {
                                      if (state.teacherProfileState!.data!
                                                  .teacher!.connects !=
                                              null &&
                                          state.teacherProfileState!.data!
                                              .teacher!.connects!.isNotEmpty) {
                                        showTwitterRemoveModel();
                                      } else {
                                        showTwitterAddModel();
                                      }
                                    },
                                    child: Container(
                                      height: 57,
                                      width: 326,
                                      decoration: BoxDecoration(
                                          // color: const Color(0xFFE9F6FF),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/svg/twitter.svg'),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                const Text(
                                                  'Twitter',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 53, 51, 51),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto'),
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                                'assets/svg/arrow.svg'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  DividerLine(),
                                  sHeightSpan,
                                  ElevatedButton(
                                    onPressed: () {
                                      state.onLogout(context);
                                    },
                                    child: const Text(
                                      "Logout",
                                    ),
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
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/available_slots");
                                },
                                child: Container(
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
                              ),
                              InkWell(
                                onTap: () async {
                                  const url =
                                      "https://www.acadque.com/termsandc";
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    launchUrl(Uri.parse(url));
                                  }
                                },
                                child: Container(
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
                              ),
                              InkWell(
                                onTap: () async {
                                  const url = "https://www.acadque.com/aboutus";
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    launchUrl(Uri.parse(url));
                                  }
                                },
                                child: Container(
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
