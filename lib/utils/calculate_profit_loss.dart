import 'dart:math';
import 'package:mgenio_flutter_challenge/models/option_contract.dart';

double calculateProfitLoss(double underlyingPrice, List<OptionContract> contracts) {
  double totalProfitLoss = 0.0;

  for (var contract in contracts) {
    double intrinsicValue = 0.0;
    if (contract.type == 'Call') {
      intrinsicValue = max(0, underlyingPrice - contract.strikePrice);
    } else if (contract.type == 'Put') {
      intrinsicValue = max(0, contract.strikePrice - underlyingPrice);
    }
    
    double contractPrice = (contract.bid + contract.ask) / 2;
    double position = contract.longShort == 'long' ? 1 : -1;
    totalProfitLoss += position * (intrinsicValue - contractPrice);
  }

  return totalProfitLoss;
}

