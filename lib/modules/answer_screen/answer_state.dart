import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/toast_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/answer_screen/model/single_question_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AnswerState extends BaseState {
  Dio dio = getHttp();

  String? questionId;

  AnswerState(context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    questionId = args["id"];
    notifyListeners();
    fetchSingleQuestion();
  }

  String? answer;

  onAnswerChange(val) {
    answer = val;
    notifyListeners();
  }

  bool submitLoading = false;

  setSubmitLoading(val) {
    submitLoading = val;
    notifyListeners();
  }

  onAnswerSubmit(context) async {
    setSubmitLoading(true);
    if (answer != null && answer!.isNotEmpty) {
      var data = {
        "answer": answer,
      };
      final response = await dio.post(
          "/questions/${singleQuestionState!.data!.question!.first.sId!}/answers",
          data: data);
      ToastService().s(response.data["status"]);
      Navigator.pop(context, true);
    } else {
      ToastService().w("Please provide answer!");
    }
    setSubmitLoading(false);
  }

  SingleQuestionResponse? singleQuestionState;

  fetchSingleQuestion() async {
    setLoading(true);
    try {
      final response = await dio.get("/questions/$questionId");
      singleQuestionState = SingleQuestionResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
