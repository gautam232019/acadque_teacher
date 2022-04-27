import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      // const Color(0xff23b6e6),
      // const Color(0xff02d39a),
      colorPrimary,
      colorPrimary,
    ];
    return Column(
      children: [
        Padding(
          padding: sPagePadding,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: colorPrimary),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Balance',
                        style: TextStyle(
                            color: colorWhite,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$ 25,520',
                        style: TextStyle(
                            color: colorWhite,
                            fontFamily: 'Roboto',
                            fontSize: 35,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/svg/arrow_front.svg')
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // Expanded(
        //   child: Column(
        //     children: [
        //       AspectRatio(
        //         aspectRatio: 1.70,
        //         child: Container(
        //           decoration: const BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Colors.black12,
        //                   offset: Offset(
        //                     2.0,
        //                     2.0,
        //                   ),
        //                   blurRadius: 2.0,
        //                   spreadRadius: 2.0,
        //                 ),
        //               ],
        //               borderRadius: BorderRadius.all(
        //                 Radius.circular(18),
        //               ),
        //               color: colorWhite),
        //           child: Padding(
        //             padding: const EdgeInsets.only(
        //                 right: 18.0, left: 12.0, top: 24, bottom: 12),
        //             child: LineChart(
        //               mainData(),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // )

        // LineChartScreen(),
      ],
    );
  }
}
