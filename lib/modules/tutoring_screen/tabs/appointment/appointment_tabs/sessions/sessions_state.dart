import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/tutor_home/models/teacher_appointment_response.dart';
import 'package:dio/dio.dart';

class SessionsState extends BaseState {
  Dio dio = getHttp();

  SessionsState() {
    fetchAppointments();
  }

  TeacherAppointmentResponse? teacherAppointmentState;

  fetchAppointments() async {
    setLoading(true);
    try {
      final response = await dio.get("/appointments");
      teacherAppointmentState =
          TeacherAppointmentResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
