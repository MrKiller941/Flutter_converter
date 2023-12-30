import 'package:converter/src/state/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelControl extends StatelessWidget {
  const PanelControl({super.key});

  @override
  Widget build(BuildContext context) {
    final converter = context.read<ConverterProvider>();
    final TextEditingController _deleteCountController =
        TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () => converter.convert(),
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
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  converter.updateHistory();
                  Navigator.pushNamed(context, "/history");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    'История',
                    style: TextStyle(color: Colors.white, fontSize: 13.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextField(
                  controller: _deleteCountController,
                  decoration: InputDecoration(
                    labelText: 'Удалить последние N записей',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String countText = _deleteCountController.text;
                  int deleteCount = int.tryParse(countText) ?? -1;
                  converter.deleteLast(deleteCount);
                },
                child: Text('Удалить историю'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
