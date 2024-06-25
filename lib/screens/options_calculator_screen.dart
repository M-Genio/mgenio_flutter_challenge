import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mgenio_flutter_challenge/models/option_contract.dart';
import 'package:mgenio_flutter_challenge/utils/calculate_profit_loss.dart';
import 'package:mgenio_flutter_challenge/widgets/risk_reward_graph.dart';

class OptionsCalculatorScreen extends StatefulWidget {
  const OptionsCalculatorScreen({super.key, required this.optionsData});

  final List<Map<String, dynamic>> optionsData;

  @override
  State<OptionsCalculatorScreen> createState() => _OptionsCalculatorScreenState();
}

class _OptionsCalculatorScreenState extends State<OptionsCalculatorScreen> {
  late List<OptionContract> optionsContracts;
  double _maxProfit = 0;
  double _maxLoss = 0;
  List<double> _breakEvenPoints = [];

  @override
  void initState() {
    super.initState();
    optionsContracts = widget.optionsData.map((data) => OptionContract.fromJson(data)).toList();
    _calculateMaxProfitLossAndBreakEven();
  }

  void _calculateMaxProfitLossAndBreakEven() {
    double minPrice = 0;
    double maxPrice = 200; // assuming a range from 0 to 200
    List<double> profits = [];

    for (double price = minPrice; price <= maxPrice; price += 1) {
      double profitLoss = calculateProfitLoss(price, optionsContracts);
      profits.add(profitLoss);
    }

    _maxProfit = profits.reduce(max);
    _maxLoss = profits.reduce(min);

    _breakEvenPoints = [];
    for (int i = 1; i < profits.length; i++) {
      if (profits[i - 1] < 0 && profits[i] >= 0) {
        _breakEvenPoints.add(i.toDouble() - 1 + (0 - profits[i - 1]) / (profits[i] - profits[i - 1]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Options Profit Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: RiskRewardGraph(contracts: optionsContracts),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Max Profit: $_maxProfit', style: const TextStyle(fontSize: 16)),
                  Text('Max Loss: $_maxLoss', style: const TextStyle(fontSize: 16)),
                  Text('Break-Even Points: ${_breakEvenPoints.join(', ')}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


