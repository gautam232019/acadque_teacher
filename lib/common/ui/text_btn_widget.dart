import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String value;

  const TextButtonWidget({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 327,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: colorPrimary,
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
              color: colorWhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
