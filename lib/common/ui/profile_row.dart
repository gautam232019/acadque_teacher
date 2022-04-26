import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const ProfileRow(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            new SvgPicture.asset(iconPath),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                )
              ],
            )
          ],
        ),
        SvgPicture.asset(
          'assets/svg/arrow_front.svg',
          color: colorBox,
        )
      ],
    );
  }
}
