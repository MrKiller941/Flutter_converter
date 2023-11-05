import 'package:flutter/material.dart';

class PanelResult extends StatelessWidget {
  final String result;

  const PanelResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 16.0,
          ),
          const Text(
            "Результат: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(result,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}
