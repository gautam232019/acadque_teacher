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

    mainData() {
      return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 6),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 3.1),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ],
      );
    }

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
                    children: const [
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
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10K';
      break;
    case 3:
      text = '30k';
      break;
    case 5:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
