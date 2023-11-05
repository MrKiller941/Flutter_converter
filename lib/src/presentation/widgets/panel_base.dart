import 'package:flutter/material.dart';

class PanelBase extends StatefulWidget {
  final Function onChange;

  const PanelBase({super.key, required this.onChange});

  @override
  State<StatefulWidget> createState() {
    return _PanelBaseState();
  }
}

class _PanelBaseState extends State<PanelBase> {
  late List<int> _bases;
  int inputBase = 10;
  int outputBase = 2;

  @override
  void initState() {
    super.initState();
    _bases = List.generate(35, (index) => index + 2);
  }

  void setBase(int input, int output) {
    setState(() {
      inputBase = input;
      outputBase = output;
      widget.onChange(inputBase, outputBase);
    });
  }

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
            "Направление перевода",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8.0),
          DropdownButton(
            value: inputBase,
            items: _bases.map((int base) {
              return DropdownMenuItem(
                value: base,
                child: Text(base.toString()),
              );
            }).toList(),
            onChanged: (base) => setBase(base!, outputBase),
          ),
          const SizedBox(width: 8.0),
          IconButton(
              onPressed: () => setBase(outputBase, inputBase),
              icon: const Icon(Icons.swap_horiz_outlined)),
          const SizedBox(width: 8.0),
          DropdownButton(
              value: outputBase,
              items: _bases.map((int base) {
                return DropdownMenuItem(
                  value: base,
                  child: Text(base.toString()),
                );
              }).toList(),
              onChanged: (base) => setBase(inputBase, base!)),
        ],
      ),
    );
  }
}
