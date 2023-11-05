import 'package:converter/src/presentation/screens/convert_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 47, 197, 55)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ConvertPage(),
    );
  }
}
