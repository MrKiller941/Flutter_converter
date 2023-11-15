import 'package:converter/src/state/converter_actions.dart';
import 'package:converter/src/state/converter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class PanelControl extends StatelessWidget {
  const PanelControl({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<ConverterState> store = StoreProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
              onPressed: () => store.dispatch(ConverterConvertAction()),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    'Вычислить',
                    style: TextStyle(color: Colors.white, fontSize: 13.0),
                  )))
        ],
      ),
    );
  }
}
