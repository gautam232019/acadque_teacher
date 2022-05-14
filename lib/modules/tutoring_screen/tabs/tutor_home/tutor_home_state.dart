import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/profile/models/teacher_profile_response.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/tutor_home/models/teacher_appointment_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class TutorHomeState extends BaseState {
  Dio dio = getHttp();

  TutorHomeState() {
    fetchTeacherProfile();
    fetchAppointments();
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
      print(teacherProfileState!.data!.teacher!.name!);
      notifyListeners();
    }
    // ignore: empty_catches
    catch (err) {
      print(err);
    }
    setLoading(false);
  }

  bool appointmentLoading = false;

  setAppointmentLoading(val) {
    appointmentLoading = val;
    notifyListeners();
  }

  TeacherAppointmentResponse? teacherAppointmentState;

  fetchAppointments() async {
    setAppointmentLoading(true);
    try {
      final response = await dio.get("/appointments");
      teacherAppointmentState =
          TeacherAppointmentResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setAppointmentLoading(false);
  }
}
