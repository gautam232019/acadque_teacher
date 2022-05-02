import 'package:acadque_teacher/core/http/http.dart';
import 'package:acadque_teacher/core/state/base_state.dart';
import 'package:acadque_teacher/modules/notification/models/notification_response.dart';
import 'package:dio/dio.dart';

class NotificationState extends BaseState {
  Dio dio = getHttp();
  NotificationResponse? notificationState;

  NotificationState() {
    getNotifications();
  }

  getNotifications() async {
    setLoading(true);
    try {
      final response = await dio.get("/notifications");
      notificationState = NotificationResponse.fromJson(response.data);
      notifyListeners();
      // ignore: empty_catches
    } catch (err) {}
    setLoading(false);
  }
}
