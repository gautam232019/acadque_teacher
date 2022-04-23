import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/profile/models/teacher_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ProfileState extends BaseState {
  Dio dio = getHttp();

  ProfileState() {
    fetchTeacherProfile();
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
      final response = await dio.get("/teachers/625bc03bf0d1a80e43f8092e");
      teacherProfileState = TeacherProfileResponse.fromJson(response.data);
      notifyListeners();
    }
    // ignore: empty_catches
    catch (err) {}
    setLoading(false);
  }
}
