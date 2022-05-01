import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/available_question_screen/tabs/available_question_home/tabs/inside_available_question/models/student_questions_response.dart';
import 'package:acadque_teacher/modules/profile/models/subject_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class InsideQuestionState extends BaseState {
  Dio dio = getHttp();

  InsideQuestionState() {
    fetchSubjects();
    fetchStudentQuestions();
  }
  String? subject;

  onSubjectChange(val) {
    subject = val;
    notifyListeners();
  }

  SubjectResponse? subjectState;

  fetchSubjects() async {
    setLoading(true);
    try {
      final response = await dio.get("/subjects");
      subjectState = SubjectResponse.fromJson(response.data);
      // ignore: empty_catches
    } catch (err) {}
  }

  StudentQuestionsResponse? studentQuestionsState;

  fetchStudentQuestions() async {
    setLoading(true);
    final token = LocalStorageService().read(LocalStorageKeys.accessToken);
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    final id = payload["userId"];
    try {
      final response = await dio.get("/teachers/$id/questions");
      studentQuestionsState = StudentQuestionsResponse.fromJson(response.data);
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
