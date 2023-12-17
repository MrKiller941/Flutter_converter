import 'package:converter/src/infrastructure/presentation/screens/convert_page.dart';
import 'package:converter/src/infrastructure/presentation/screens/history_page.dart';
import 'package:converter/src/state/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ConverterProvider())],
      child: MaterialApp(
        title: 'Converter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 47, 197, 55)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/converter': (context) => const ConvertPage(),
          '/history': (context) => const HistoryPage(),
        },
        initialRoute: "/converter",
      ),
    );
  }
}
