import 'package:converter/src/state/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelBase extends StatelessWidget {
  final List<int> _bases = List.generate(35, (index) => index + 2);

  PanelBase({super.key});

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
              "Направление перевода",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8.0),
            DropdownButton(
              value: converter.inputBase,
              items: _bases.map((int base) {
                return DropdownMenuItem(
                  value: base,
                  child: Text(base.toString()),
                );
              }).toList(),
              onChanged: (base) =>
                  converter.setInputBase(base!),
            ),
            const SizedBox(width: 8.0),
            IconButton(
                onPressed: () {
                  converter.reverseBases();
                },
                icon: const Icon(Icons.swap_horiz_outlined)),
            const SizedBox(width: 8.0),
            DropdownButton(
                value: converter.outputBase,
                items: _bases.map((int base) {
                  return DropdownMenuItem(
                    value: base,
                    child: Text(base.toString()),
                  );
                }).toList(),
                onChanged: (base) => converter.setOutputBase(base!)),
          ],
        )
    );
  }
}
