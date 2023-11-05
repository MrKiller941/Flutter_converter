import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ошибка'),
      content: const Text('Некорректный ввод числа'),
      actions: <Widget>[
        TextButton(
          child: const Text('Закрыть'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
