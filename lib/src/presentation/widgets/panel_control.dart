import 'package:flutter/material.dart';

class PanelControl extends StatelessWidget {
  final Function onClick;

  const PanelControl({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
              onPressed: () => onClick(),
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
