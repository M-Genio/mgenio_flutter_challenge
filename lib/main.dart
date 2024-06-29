import 'package:flutter/material.dart';
import 'package:mgenio_flutter_challenge/screens/options_calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Options Profit Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OptionsCalculatorScreen(
        optionsData: [
          {
            "strike_price": 100.0 * 2, // Doubling the strike price and converting to double
            "type": "Call",
            "bid": 10.05,
            "ask": 12.04,
            "long_short": "long",
            "expiration_date": "2025-12-17T00:00:00Z"
          },
          {
            "strike_price": 102.50 * 2, // Doubling the strike price
            "type": "Call",
            "bid": 12.10,
            "ask": 14.0,
            "long_short": "long",
            "expiration_date": "2025-12-17T00:00:00Z"
          },
          {
            "strike_price": 103.0 * 2, // Doubling the strike price and converting to double
            "type": "Put",
            "bid": 14.0,
            "ask": 15.50,
            "long_short": "short",
            "expiration_date": "2025-12-17T00:00:00Z"
          },
          {
            "strike_price": 105.0 * 2, // Doubling the strike price and converting to double
            "type": "Put",
            "bid": 16.0,
            "ask": 18.0,
            "long_short": "long",
            "expiration_date": "2025-12-17T00:00:00Z"
          }
        ],
      ),
    );
  }
}
