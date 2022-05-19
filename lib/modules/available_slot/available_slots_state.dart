import 'dart:convert';

import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/available_slot/models/teacher_schedules.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AvailableSlotsState extends BaseState {
  Dio dio = getHttp();

  List<DateTime> selectedDates = [];

  onDateTimeSelect(val) {
    bool kera = selectedDates.contains(val);
    if (kera != true) {
      selectedDates.add(val);
      notifyListeners();
    }
  }

  AvailableSlotsState() {
    fetchSchedules();
  }

  String? token;
  String? id;

  TeacherSchedules? teacherScheduleState;

  fetchSchedules() async {
    setLoading(true);
    try {
      token = LocalStorageService().read(LocalStorageKeys.accessToken) ?? "";
      notifyListeners();
      Map<String, dynamic> user = Jwt.parseJwt(token!);
      id = user["userId"] as String;
      notifyListeners();
      final response =
          await dio.get("/teachers/$id/schedules?year=${DateTime.now().year}");
      teacherScheduleState = TeacherSchedules.fromJson(response.data);
      notifyListeners();
    } catch (err) {
      print(err);
    }
    setLoading(false);
  }

  onRemoveSelectedDate(val) {
    selectedDates.remove(val);
    notifyListeners();
  }

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  onStartTimeChange(val) {
    startTime = val;
    notifyListeners();
  }

  onEndTimeChange(TimeOfDay val) {
    if (startTime!.hour < val.hour) {
      endTime = val;
      notifyListeners();
    } else {
      ToastService().w("Start time should be smaller than end time!");
    }
  }

  onSubmit(context) async {
    if (selectedDates.isNotEmpty && startTime != null && endTime != null) {
      List<int> days = [];
      for (var day in selectedDates) {
        days.add(day.day);
      }
      int month = selectedDates[0].month;
      int year = selectedDates[0].year;

      int from =
          (startTime!.hour * 60 * 60 * 1000) + (startTime!.minute * 60 * 1000);
      int to = (endTime!.hour * 60 * 60 * 1000) + (endTime!.minute * 60 * 1000);
      var data = {
        "year": year,
        "month": month,
        "days": days,
        "from": from,
        "to": to,
      };
      final token = LocalStorageService().read(LocalStorageKeys.accessToken);
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      final userId = payload["userId"];
      setLoading(true);
      try {
        await dio.put("/teachers/$userId/schedules", data: data);
        ToastService().s("Available slots added!");
        Navigator.pop(context);
        // ignore: empty_catches
      } catch (err) {}
      setLoading(false);
    } else {
      ToastService().w("Please select dates and time!");
    }
  }
}
