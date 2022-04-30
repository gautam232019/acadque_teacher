import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackIconWidget extends StatelessWidget {
  final String icon;
  final int size;

  const FeedbackIconWidget({Key? key, required this.icon, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/feedback/${icon}_icon.svg',
      height: size.toDouble(),
      width: size.toDouble(),
    );
  }
}
