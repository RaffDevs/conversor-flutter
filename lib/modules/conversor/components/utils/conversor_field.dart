import 'package:conversor/modules/conversor/models/currencies.dart';
import 'package:flutter/material.dart';

class ConversorField extends StatelessWidget {
  const ConversorField({
    Key? key,
    required this.countryCurrency
    
  }) : super(key: key);

  final Currencies countryCurrency;

  Map<String, String> get currency {
    switch(countryCurrency) {
      case Currencies.brazil:
        return { "label": 'Reais', "prefix": "R\$" };
      case Currencies.usa:
        return { "label": "Dólar", "prefix": "US\$" };
      case Currencies.europe:
        return { "label": "Euro", "prefix": "€" };
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(currency["label"].toString()),
        prefixText: currency["prefix"],
      ),
      cursorColor: Colors.amber,
      style: const TextStyle(
        color: Colors.amber
      ),
    );
  }
}