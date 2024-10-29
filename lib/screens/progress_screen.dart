import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../constants.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Progress',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout Progress',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return Text('Mon');
                            case 2:
                              return Text('Tue');
                            case 3:
                              return Text('Wed');
                            case 4:
                              return Text('Thu');
                            case 5:
                              return Text('Fri');
                            case 6:
                              return Text('Sat');
                            case 7:
                              return Text('Sun');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 3),
                        FlSpot(2, 4),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
                        FlSpot(5, 3),
                        FlSpot(6, 4),
                        FlSpot(7, 6),
                      ],
                      isCurved: true,
                      color: ColorConstants.accentColor,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: true, color: ColorConstants.accentColor.withOpacity(0.3)),
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  minX: 1,
                  maxX: 7,
                  minY: 0,
                  maxY: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
