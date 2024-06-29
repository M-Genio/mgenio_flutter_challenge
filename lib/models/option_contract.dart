class OptionContract {
  final double strikePrice;
  final String type;
  final double bid;
  final double ask;
  final String longShort;
  final DateTime expirationDate;

  OptionContract({
    required this.strikePrice,
    required this.type,
    required this.bid,
    required this.ask,
    required this.longShort,
    required this.expirationDate,
  });

  factory OptionContract.fromMap(Map<String, dynamic> map) {
    return OptionContract(
      strikePrice: map['strike_price'].toDouble(),
      type: map['type'],
      bid: map['bid'].toDouble(),
      ask: map['ask'].toDouble(),
      longShort: map['long_short'],
      expirationDate: DateTime.parse(map['expiration_date']),
    );
  }
}
