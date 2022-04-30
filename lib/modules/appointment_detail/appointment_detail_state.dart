import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/appointment_detail/models/appointment_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppointmentDetailState extends BaseState {
  Dio dio = getHttp();

  String? appointmentId;
  AppointmentDetailState(context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    appointmentId = args['id'];
    notifyListeners();
    fetchAppoint();
  }

  AppointmentDetailResponse? appointmentState;

  fetchAppoint() async {
    setLoading(true);
    try {
      final response = await dio.get("/appointments/$appointmentId");
      appointmentState = AppointmentDetailResponse.fromJson(response.data);
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
