import 'package:mgenio_flutter_challenge/models/option_contract.dart';

double calculateProfitLoss(double underlyingPrice, List<OptionContract> contracts) {
  double totalProfitLoss = 0.0;

  for (var contract in contracts) {
    double intrinsicValue;
    if (contract.type == 'Call') {
      intrinsicValue = (underlyingPrice - contract.strikePrice).clamp(0.0, double.infinity);
    } else {
      intrinsicValue = (contract.strikePrice - underlyingPrice).clamp(0.0, double.infinity);
    }

    double optionPrice = (contract.bid + contract.ask) / 2;

    if (contract.longShort == 'long') {
      totalProfitLoss += intrinsicValue - optionPrice;
    } else {
      totalProfitLoss += optionPrice - intrinsicValue;
    }
  }

  return totalProfitLoss;
}
