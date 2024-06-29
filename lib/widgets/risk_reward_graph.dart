import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mgenio_flutter_challenge/models/option_contract.dart';
import 'package:mgenio_flutter_challenge/utils/calculate_profit_loss.dart';

class RiskRewardGraph extends StatelessWidget {
  final List<OptionContract> contracts;

  const RiskRewardGraph({super.key, required this.contracts});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: _generateDataPoints(),
            isCurved: false,
            barWidth: 2,
            color: Colors.blue,
            belowBarData: BarAreaData(show: true, color: Colors.lightBlue.withOpacity(0.3)),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        gridData: FlGridData(show: true),
      ),
    );
  }

  List<FlSpot> _generateDataPoints() {
    List<FlSpot> dataPoints = [];
    for (double price = 0; price <= 200; price += 1) {
      double profitLoss = calculateProfitLoss(price, contracts);
      dataPoints.add(FlSpot(price, profitLoss));
    }
    return dataPoints;
  }
}

