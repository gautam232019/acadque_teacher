import 'dart:io';

import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/profile/models/subject_response.dart';
import 'package:acadque_teacher/modules/profile/models/teacher_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileState extends BaseState {
  Dio dio = getHttp();

  ProfileState() {
    fetchTeacherProfile();
  }

  Map<String, dynamic> form = {};

  onChange(String key, dynamic value) {
    form[key] = value;
    notifyListeners();
  }

  TeacherProfileResponse? teacherProfileState;
  String? id;
  String? token;
  fetchTeacherProfile() async {
    setLoading(true);
    try {
      token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
      notifyListeners();
      Map<String, dynamic> user = Jwt.parseJwt(token!);
      id = user["userId"] as String;
      final response = await dio.get("/teachers/$id");
      teacherProfileState = TeacherProfileResponse.fromJson(response.data);
      notifyListeners();
      List<String> teacherSubjects = [];
      for (var element in teacherProfileState!.data!.teacher!.subjects!) {
        teacherSubjects.add(element.sId!);
      }
      if (teacherSubjects.isNotEmpty) onChange("subjects", teacherSubjects);
      fetchSubjects();
    }
    // ignore: empty_catches
    catch (err) {}
  }

  onSubjectEdit() async {
    setLoading(true);
    try {
      Map<String, dynamic> user = Jwt.parseJwt(token!);
      id = user["userId"] as String;
      await dio.patch(
          "https://api-acadque.herokuapp.com/api/v1/teachers/$id/subjects",
          data: form);
      ToastService().s("Successfully updated!");
      fetchTeacherProfile();
      // ignore: empty_catches
    } catch (err) {}
  }

  onSubmit(field) async {
    setLoading(true);
    try {
      Map<String, dynamic> user = Jwt.parseJwt(token!);
      id = user["userId"] as String;
      await dio.patch("/teachers/$id", data: form);
      ToastService().s("Successfully updated!");
      fetchTeacherProfile();
      // ignore: empty_catches
    } catch (err) {}
  }

  final ImagePicker picker = ImagePicker();

  File? imagefile;

  pickFromCamera(context) async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      File temp = File(file.path);
      final kera = temp.readAsBytesSync().lengthInBytes;
      final kb = kera / 1024;
      final mb = kb / 1024;
      int finalMb = mb.toInt();
      if (finalMb <= 10) {
        imagefile = File(file.path);
      } else {
        ToastService().w("Maximum image size is 10 MB!");
        return;
      }
    }
    notifyListeners();
    updateProfile();
  }

  pickFromGallery(context) async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      File temp = File(file.path);
      final kera = temp.readAsBytesSync().lengthInBytes;
      final kb = kera / 1024;
      final mb = kb / 1024;
      int finalMb = mb.toInt();
      if (finalMb <= 10) {
        imagefile = File(file.path);
      } else {
        ToastService().w("Maximum image size is 10 MB!");
        return;
      }
    }
    notifyListeners();
    updateProfile();
  }

  updateProfile() async {
    setLoading(true);
    try {
      var data = FormData.fromMap(
          {"student_image": await MultipartFile.fromFile(imagefile!.path)});
      await dio.patch("/teachers/uploadprofile", data: data);
      ToastService().s("Profile uploaded");
      fetchTeacherProfile();
      // ignore: empty_catches
    } catch (err) {}
  }

  SubjectResponse? subjectState;

  fetchSubjects() async {
    try {
      final response = await dio.get("/subjects");
      subjectState = SubjectResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }

  onLogout(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure you want to logout?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  LocalStorageService().clear(LocalStorageKeys.accessToken);
                  LocalStorageService().clear(LocalStorageKeys.email);
                  LocalStorageService()
                      .clear(LocalStorageKeys.isNaviveProvider);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ],
          );
        });
  }

  bool showOtpField = false;

  bool contactUpdateLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  setShowOtpField(val) {
    showOtpField = val;
    notifyListeners();
  }

  setContactLoading(val) {
    contactUpdateLoading = val;
    notifyListeners();
  }

  String contactNumber = "";

  String codeSms = "";

  onContactChange(val) {
    contactNumber = val;
    notifyListeners();
  }

  onCodeSmsChange(val) {
    codeSms = val;
    notifyListeners();
  }

  String? submitVerificationId;

  sendOtp() async {
    if (contactNumber.isNotEmpty) {
      try {
        contactUpdateLoading == true;
        notifyListeners();
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+91 $contactNumber",
          verificationCompleted: (PhoneAuthCredential credential) async {
            final user =
                await FirebaseAuth.instance.signInWithCredential(credential);
            if (user.user != null) {
              ToastService().s("Successfull!");
            }
          },
          verificationFailed: (FirebaseAuthException exception) {
            ToastService().e(exception.message!);
          },
          codeSent: (String verificationId, int? resendToken) {
            setShowOtpField(true);
            submitVerificationId = verificationId;
            notifyListeners();
            ToastService().s("Otp sent!");
          },
          codeAutoRetrievalTimeout: (val) {},
        );
      } catch (err) {
        ToastService().e(err.toString());
      }
    } else {
      ToastService().w("Please provide contact!");
    }
  }

  onContactUpdateSubmit(context) async {
    if (submitVerificationId != null && codeSms.isNotEmpty) {
      try {
        final response = PhoneAuthProvider.credential(
            verificationId: submitVerificationId!, smsCode: codeSms);
        await FirebaseAuth.instance.signInWithCredential(response);
        final token = await FirebaseAuth.instance.currentUser!.getIdToken();
        this.token = token;
        notifyListeners();
        sendContactNumber(context);
        // ignore: empty_catches
      } catch (err) {}
    } else {
      ToastService().w("Please provide Otp!");
    }
  }

  sendContactNumber(context) async {
    try {
      await dio.patch("/auth/updatecontact?idToken=$token");
      ToastService().s("Contact Successfully added!");
      Navigator.pop(context);
      fetchTeacherProfile();
      // ignore: empty_catches
    } catch (err) {}
  }

  String newEmail = "";
  onNewEmailChange(val) {
    newEmail = val;
    notifyListeners();
  }

  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  onNewEmailUpdateSubmit(context) async {
    if (newEmail.isNotEmpty) {
      if (emailFormKey.currentState!.validate()) {
        try {
          final data = {
            "email": newEmail,
          };
          await dio.patch("/auth/updateemail", data: data);
          ToastService().s("Email id updated successfully!");
          Navigator.pop(context);
          fetchTeacherProfile();
          // ignore: empty_catches
        } catch (err) {}
      }
    } else {
      ToastService().w("Please provide email!");
    }
  }

  String oldPassword = "";
  String newPassword = "";

  onNewPasswordChange(val) {
    newPassword = val;
    notifyListeners();
  }

  onOldPasswordChange(val) {
    oldPassword = val;
    notifyListeners();
  }

  onPasswordUpdate(context) async {
    if (oldPassword.isNotEmpty && newPassword.isNotEmpty) {
      if (formKey.currentState!.validate()) {
        try {
          final user = FirebaseAuth.instance.currentUser;
          final cred = EmailAuthProvider.credential(
              email: teacherProfileState!.data!.teacher!.email!,
              password: oldPassword);

          final result = await user!.reauthenticateWithCredential(cred);
          if (result.user != null) {
            await result.user!.updatePassword(newPassword);
            ToastService().s("Password changed successfully!");
            Navigator.of(context).pop(true);
          }
        } catch (err) {
          ToastService().e(err.toString());
          Navigator.of(context).pop(true);
        }
      } else {
        ToastService().w(
            "Password must contain uppercase, lowercase, number and character!");
      }
    } else {
      ToastService().w("Please provide password!");
    }
    setLoading(false);
  }

  String? twitterlink;

  onTwitterlinkChange(val) {
    twitterlink = val;
    notifyListeners();
  }

  onTwitterLinkSubmit(context) async {
    if (twitterKey.currentState!.validate()) {
      try {
        var data = {
          "name": "twitter",
          "url": twitterlink,
        };
        await dio.patch(
            "/teachers/${teacherProfileState!.data!.teacher!.sId}/connects",
            data: data);
        ToastService().s("Link added!");
        Navigator.pop(context);
      } catch (err) {
        Navigator.pop(context);
      }
    } else {
      ToastService().w("Please add twitter link");
    }
  }

  final GlobalKey<FormState> twitterKey = GlobalKey<FormState>();
}
