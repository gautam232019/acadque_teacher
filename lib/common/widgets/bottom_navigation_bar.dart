import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final String isActive;
  final dynamic onTabChanged;

  const BottomNavBar(
      {Key? key, required this.isActive, required this.onTabChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 68,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                isActive != 'home'
                    ? onTabChanged('home')
                    : print('Already on Home');
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: isActive == 'home'
                      ? Color(0xFF59AEFD)
                      : Color(0xFFA6A6A6),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                isActive != 'ask'
                    ? onTabChanged('ask')
                    : print('Already on Stats');
              },
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    'assets/svg/book.svg',
                    color: isActive == 'ask'
                        ? Color(0xFF59AEFD)
                        : Color(0xFFA6A6A6),
                  )),
            ),
            InkWell(
              onTap: () {
                isActive != 'profile'
                    ? onTabChanged('profile')
                    : print('Already on Profile');
              },
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    'assets/svg/person.svg',
                    color: isActive == 'profile'
                        ? Color(0xFF59AEFD)
                        : Color(0xFFA6A6A6),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
