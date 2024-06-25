class OptionContract {
  final double strikePrice;
  final String type; // "Call" or "Put"
  final double bid;
  final double ask;
  final String longShort; // "long" or "short"
  final DateTime expirationDate;

  OptionContract({
    required this.strikePrice,
    required this.type,
    required this.bid,
    required this.ask,
    required this.longShort,
    required this.expirationDate,
  });

  factory OptionContract.fromJson(Map<String, dynamic> json) {
    
    return OptionContract(
      strikePrice: json['strike_price'],
      type: json['type'],
      bid: json['bid'],
      ask: json['ask'],
      longShort: json['long_short'],
      expirationDate: DateTime.parse(json['expiration_date']),
    );
  }
}
