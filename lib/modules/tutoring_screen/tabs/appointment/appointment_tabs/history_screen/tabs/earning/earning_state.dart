import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/earning/models/monthly_income_response.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/earning/models/total_income_response.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class EarningState extends BaseState {
  Dio dio = getHttp();

  EarningState() {
    getTotalIncome();
  }

  String? userId;

  TotalIncomeResponse? totalIncomeState;

  getTotalIncome() async {
    final token = LocalStorageService().read(LocalStorageKeys.accessToken);
    final Map<String, dynamic> payload = Jwt.parseJwt(token!);
    userId = payload["userId"];
    notifyListeners();
    setLoading(true);
    try {
      final response = await dio.get("/teachers/$userId/totalbalance");
      totalIncomeState = TotalIncomeResponse.fromJson(response.data);
      notifyListeners();
      getMonthlyIcome();
      // ignore: empty_catches
    } catch (err) {
      print(err);
    }
  }

  MonthlyIncomeResponse? monthlyIncomeState;

  getMonthlyIcome() async {
    try {
      final response = await dio
          .get("/teachers/$userId/monthlyincome?year=${DateTime.now().year}");
      monthlyIncomeState = MonthlyIncomeResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {
      print(err);
    }
    setLoading(false);
  }
}
