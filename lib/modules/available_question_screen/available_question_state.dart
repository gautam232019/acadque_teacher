import 'package:acadque_teacher/core/state/base_state.dart';

class AvailableQuestionState extends BaseState {
  int bottomIndex = 0;
  onBottomItemTapped(int index, context) {
    bottomIndex = index;
    notifyListeners();
  }
}
