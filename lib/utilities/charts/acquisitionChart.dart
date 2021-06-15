import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

LineChartData acquisitionChart(List<FlSpot> expenses, List<FlSpot> income) {

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey[200],
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey[200],
          strokeWidth: 1,
        );
      },
    ),

    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) =>
        const TextStyle(color: Colors.black, fontSize: 12),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Jan';
            case 1:
              return 'Feb';
            case 2:
              return 'Mar';
            case 3:
              return 'Apr';
            case 4:
              return 'May';
            case 5:
              return 'Jun';
          }
          return '';
        },
        margin: 8,
      ),

      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '0';
            case 1:
              return '100';
            case 2:
              return '200';
            case 3:
              return '300';
            case 4:
              return '400';
            case 5:
              return '500';
            case 6:
              return '600';
            case 7:
              return '700';
            case 8:
              return '800';
            case 9:
              return '900';
            case 10:
              return '1000';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData:
    FlBorderData(show: true, border: Border.all(color: Colors.grey[400], width: 1)),
    minX: 0,
    maxX: 5,
    minY: 0,
    maxY: 10,
    lineBarsData: [
      // Income
      LineChartBarData(
        spots: income,
        isCurved: true,
        colors: gradientColors,
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors.map((color) => color.withOpacity(0.9)).toList(),
        ),
      ),
      // Expenses
      LineChartBarData(
        spots: expenses,
        isCurved: true,
        colors: gradientColors2,
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors2.map((color) => color.withOpacity(0.9)).toList(),
        ),
      ),
    ],
  );
}