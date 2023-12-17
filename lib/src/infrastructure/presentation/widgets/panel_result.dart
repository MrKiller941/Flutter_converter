import 'package:converter/src/state/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelResult extends StatelessWidget {
  const PanelResult({super.key});

  @override
  Widget build(BuildContext context) {

    final converter = context.watch<ConverterProvider>();

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
            if (converter.status == "success")
              Text(converter.outputNumber.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
              )),
            if (converter.status == "error")
              const Text("ошибка",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
            )),
          ],
        ),
      );
  }
}
