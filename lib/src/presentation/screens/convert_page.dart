import 'package:converter/src/domain/number_converter.dart';
import 'package:converter/src/presentation/dialogs/error_dialog.dart';
import 'package:converter/src/presentation/widgets/panel_base.dart';
import 'package:converter/src/presentation/widgets/panel_control.dart';
import 'package:converter/src/presentation/widgets/panel_input.dart';
import 'package:converter/src/presentation/widgets/panel_result.dart';
import 'package:flutter/material.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ConvertPageState();
  }
}

class _ConvertPageState extends State<ConvertPage> {
  int inputBase = 10;
  int outputBase = 2;
  String inputNumber = '';
  String? outputNumber;

  void convert() {
    var numberConverter = NumberConverter();
    String? result =
        numberConverter.convert(inputNumber, inputBase, outputBase);
    setState(() {
      outputNumber = result;
    });
    if (result == null) {
      showErrorDialog();
    }
  }

  void setBase(int input, int output) {
    setState(() {
      inputBase = input;
      outputBase = output;
    });
  }

  void setInputString(String number) {
    setState(() {
      inputNumber = number;
    });
  }

  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ErrorDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        PanelInput(onChange: setInputString),
        PanelBase(onChange: setBase),
        PanelControl(
          onClick: () {
            convert();
          },
        ),
        if (outputNumber != null) PanelResult(result: outputNumber!),
      ],
    )));
  }
}
