import 'package:converter/src/presentation/screens/convert_page.dart';
import 'package:converter/src/state/converter_reducer.dart';
import 'package:converter/src/state/converter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<ConverterState>(reducer,
      initialState: ConverterState.initialState());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Converter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 47, 197, 55)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const ConvertPage(),
      ),
    );
  }
}
