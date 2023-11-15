import 'package:converter/src/state/converter_actions.dart';
import 'package:converter/src/state/converter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class PanelBase extends StatelessWidget {
  final List<int> _bases = List.generate(35, (index) => index + 2);

  PanelBase({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<ConverterState> store = StoreProvider.of(context);

    return StoreConnector<ConverterState, ConverterState>(
      converter: (store) => store.state,
      builder: (context, state) => Padding(
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
              value: state.inputBase,
              items: _bases.map((int base) {
                return DropdownMenuItem(
                  value: base,
                  child: Text(base.toString()),
                );
              }).toList(),
              onChanged: (base) =>
                  store.dispatch(ConverterUpdateInputBaseAction(base!)),
            ),
            const SizedBox(width: 8.0),
            IconButton(
                onPressed: () {
                  final inputBase = state.inputBase;
                  final outputBase = state.outputBase;
                  store.dispatch(ConverterUpdateInputBaseAction(outputBase));
                  store.dispatch(ConverterUpdateOutputBaseAction(inputBase));
                },
                icon: const Icon(Icons.swap_horiz_outlined)),
            const SizedBox(width: 8.0),
            DropdownButton(
                value: state.outputBase,
                items: _bases.map((int base) {
                  return DropdownMenuItem(
                    value: base,
                    child: Text(base.toString()),
                  );
                }).toList(),
                onChanged: (base) =>
                    store.dispatch(ConverterUpdateOutputBaseAction(base!))),
          ],
        ),
      ),
    );
  }
}
