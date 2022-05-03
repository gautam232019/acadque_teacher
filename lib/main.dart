import 'package:acadque_teacher/core/services/local_storage_service.dart';
import 'package:acadque_teacher/modules/answer_screen/answer_screen.dart';
import 'package:acadque_teacher/modules/answer_screen/answer_state.dart';
import 'package:acadque_teacher/modules/appointment_detail/appointment_detail_screen.dart';
import 'package:acadque_teacher/modules/appointment_detail/appointment_detail_state.dart';
import 'package:acadque_teacher/modules/available_question_screen/available_question_screen.dart';
import 'package:acadque_teacher/modules/available_question_screen/available_question_state.dart';
import 'package:acadque_teacher/modules/front_screen/front_screen.dart';
import 'package:acadque_teacher/modules/front_screen/front_state.dart';
import 'package:acadque_teacher/modules/login/login_screen.dart';
import 'package:acadque_teacher/modules/login/login_state.dart';
import 'package:acadque_teacher/modules/notification/notification_screen.dart';
import 'package:acadque_teacher/modules/notification/notification_state.dart';
import 'package:acadque_teacher/modules/register/register_screen.dart';
import 'package:acadque_teacher/modules/register/register_state.dart';
import 'package:acadque_teacher/modules/splash/splash_screen.dart';
import 'package:acadque_teacher/modules/splash/splash_state.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tutoring_screen.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tutoring_state.dart';
import 'package:acadque_teacher/modules/welcome_screen/welcome_screen.dart';
import 'package:acadque_teacher/modules/welcome_screen/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();

  runApp(const App());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = LocalStorageService().read(LocalStorageKeys.firstTime);
    bool isFirstTime = false;
    if (data == null) {
      isFirstTime = true;
      LocalStorageService().write(LocalStorageKeys.firstTime, "no");
    } else {
      isFirstTime = false;
    }
    return OKToast(
      child: MaterialApp(
        key: navigatorKey,
        routes: {
          '/splash': (context) => ChangeNotifierProvider(
                create: (_) => SplashState(context),
                child: const SplashScreen(),
              ),
          '/login': (context) => ChangeNotifierProvider(
                create: (_) => LoginState(),
                child: const LoginScreen(),
              ),
          '/register': (context) => ChangeNotifierProvider(
                create: (_) => RegisterState(),
                child: const RegisterScreen(),
              ),
          '/welcome': (context) => ChangeNotifierProvider(
                create: (_) => WelcomeState(),
                child: const WelcomeScreen(),
              ),
          '/tutoring': (context) => ChangeNotifierProvider(
                create: (_) => TutoringState(),
                child: const TutoringScreen(),
              ),
          '/appointment_detail': (context) => ChangeNotifierProvider(
                create: (_) => AppointmentDetailState(context),
                child: const AppointmentDetailScreen(),
              ),
          '/available_question': (context) => ChangeNotifierProvider(
                create: (_) => AvailableQuestionState(),
                child: const AvailableQuestionScreen(),
              ),
          '/answer_screen': (context) => ChangeNotifierProvider(
                create: (_) => AnswerState(context),
                child: const AnswerScreen(),
              ),
          '/notification': (context) => ChangeNotifierProvider(
                create: (_) => NotificationState(),
                child: const NotificationScreen(),
              ),
          '/front': (context) => ChangeNotifierProvider(
                create: (_) => FrontState(),
                child: const FrontScreen(),
              ),
        },
        initialRoute: isFirstTime ? "/front" : "/splash",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
