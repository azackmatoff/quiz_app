import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/common/theme/app_theme.dart';
import 'package:quiz_app/flutter_way/screens/quiz_screen.dart';
import 'package:quiz_app/getx/screens/getx_quiz_screen.dart';
import 'package:quiz_app/provider/providers/prv_quiz_screen_provider.dart';
import 'package:quiz_app/provider/screens/prv_quiz_screen.dart';

void main() {
  runApp(const GetxApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const QuizScreen(),
    );
  }
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: ChangeNotifierProvider(
        create: (context) => PrvQuizScreenProvider()..init(),
        child: const PrvQuizScreen(),
      ),
    );
  }
}

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: GetxQuizScreen(),
    );
  }
}
