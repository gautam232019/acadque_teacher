import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;

  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: isActive ? 7 : 7,
      width: isActive ? 26 : 7,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF33354E) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
