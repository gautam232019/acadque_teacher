import 'package:acadque_teacher/common/ui/ui_helpers.dart';
import 'package:acadque_teacher/common/utils/colors_util.dart';
import 'package:acadque_teacher/modules/tutoring_screen/tabs/appointment/appointment_tabs/history_screen/tabs/earning/earning_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<EarningState>(context);
    List<Color> gradientColors = [
      colorPrimary,
      colorPrimary,
    ];

    LineChartData mainData() {
      return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.bold,
                fontSize: 8),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'JAN';
                case 2:
                  return 'FEB';
                case 3:
                  return 'MAR';
                case 4:
                  return 'APR';
                case 5:
                  return 'MAY';
                case 6:
                  return 'JUN';
                case 7:
                  return 'JUL';
                case 8:
                  return 'AUG';
                case 9:
                  return 'SEP';
                case 10:
                  return 'OCT';
                case 11:
                  return 'NOV';
                case 12:
                  return 'DEC';
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '10k';
                case 3:
                  return '30k';
                case 5:
                  return '50k';
              }
              return '';
            },
            reservedSize: 32,
            margin: 12,
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 0)),
        minX: 1,
        maxX: 12,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              // FlSpot(4, 3),
              // FlSpot(3, 5),
            ],
            isCurved: true,
            colors: gradientColors,
            barWidth: 1,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
          ),
        ],
      );
    }

    return Container(
      child: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: sPagePadding,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorPrimary),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'My Balance',
                                style: TextStyle(
                                    color: colorWhite,
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              if (state
                                  .totalIncomeState!.data!.balance!.isNotEmpty)
                                Text(
                                  '\$ ${state.totalIncomeState!.data!.balance!.first.available!.toString()}',
                                  style: const TextStyle(
                                      color: colorWhite,
                                      fontFamily: 'Roboto',
                                      fontSize: 35,
                                      fontWeight: FontWeight.normal),
                                )
                              else
                                const Text(
                                  "\$ 0",
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
                Expanded(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.70,
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: colorWhite),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 18.0, left: 12.0, top: 24, bottom: 12),
                            child: LineChart(mainData()),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
