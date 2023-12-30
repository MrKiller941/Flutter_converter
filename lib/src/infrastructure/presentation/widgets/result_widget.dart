import 'package:converter/src/domain/history/result.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final Result result;

  const ResultWidget(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          result.inputNumber,
          style: const TextStyle(fontSize: 32),
        ),
        Text(
          "(${result.inputBase})",
          style: const TextStyle(fontSize: 16),
        ),
        const Text(
          " = ",
          style: TextStyle(fontSize: 32),
        ),
        Text(
          result.outputNumber,
          style: const TextStyle(fontSize: 32),
        ),
        Text(
          "(${result.outputBase})",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
