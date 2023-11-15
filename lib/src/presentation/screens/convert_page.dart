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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const PanelInput(),
        PanelBase(),
        const PanelControl(),
        const PanelResult(),
      ],
    )));
  }
}
