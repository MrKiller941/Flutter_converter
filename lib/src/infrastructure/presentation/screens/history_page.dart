import 'package:converter/src/infrastructure/presentation/widgets/result_widget.dart';
import 'package:converter/src/state/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final converter = context.watch<ConverterProvider>();

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: converter.savedResults
                    .map((e) => ResultWidget(e))
                    .toList()
                    .reversed
                    .toList())));
  }
}
