import 'package:converter/src/state/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelInput extends StatelessWidget {
  const PanelInput({super.key});

  @override
  Widget build(BuildContext context) {
    
    final converter = context.read<ConverterProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 16.0,
          ),
          const Text(
            'Исходное число',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              onChanged: (text) => converter.setInputNumber(text),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
