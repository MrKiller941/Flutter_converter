import 'package:converter/src/state/converter_actions.dart';
import 'package:converter/src/state/converter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class PanelResult extends StatelessWidget {
  const PanelResult({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<ConverterState> store = StoreProvider.of(context);
    return StoreConnector<ConverterState, ConverterState>(
      converter: (store) => store.state,
      onDidChange: (prev, vm) {
        if (vm.status == "error") {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Ошибка'),
                    content: const Text('Некорректный ввод числа'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Закрыть'),
                        onPressed: () {
                          store.dispatch(ConverterResetStatusAction());
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ));
        }
      },
      builder: (context, state) => Padding(
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
            if (state.status == "success")
              Text(state.outputNumber.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
          ],
        ),
      ),
    );
  }
}
