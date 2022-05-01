import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/concluded/models/answered_questions_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ConcludedState extends BaseState {
  Dio dio = getHttp();

  ConcludedState() {
    fetchStudentAnswers();
  }

  AnsweredQuestionResponse? answeredQuestionState;

  fetchStudentAnswers() async {
    setLoading(true);
    final token = LocalStorageService().read(LocalStorageKeys.accessToken);
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    final id = payload["userId"];
    try {
      final response = await dio.get("/teachers/$id/answers");
      answeredQuestionState = AnsweredQuestionResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
