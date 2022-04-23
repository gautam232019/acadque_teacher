import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFE5E5E5),
      height: 30,
      thickness: 1,
      indent: 5,
      endIndent: 5,
    );
  }
}
