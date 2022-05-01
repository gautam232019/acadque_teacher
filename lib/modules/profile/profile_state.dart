import 'dart:io';

import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/profile/models/subject_response.dart';
import 'package:acadque_teacher/modules/profile/models/teacher_profile_response.dart';
import 'package:dio/dio.dart';
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ],
          );
        });
  }
}
