import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/sabak_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          // primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 19, 214, 6),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.greenAccent), // Primary button color
              foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white)),
      home: const SabakScreen(),
    );
  }
}
