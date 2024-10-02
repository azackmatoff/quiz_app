import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/common/theme/app_theme.dart';
import 'package:quiz_app/flutter_bloc/bloc/bloc/bloc_quiz_screen_bloc.dart';
import 'package:quiz_app/flutter_bloc/bloc/screens/bloc_quiz_screen.dart';
import 'package:quiz_app/flutter_bloc/cubit/cubit/cubit_quiz_screen_cubit.dart';
import 'package:quiz_app/flutter_bloc/cubit/screens/cubit_quiz_screen.dart';
import 'package:quiz_app/flutter_way/screens/quiz_screen.dart';
import 'package:quiz_app/getx/screens/getx_quiz_screen.dart';
import 'package:quiz_app/provider/providers/prv_quiz_screen_provider.dart';
import 'package:quiz_app/provider/screens/prv_quiz_screen.dart';

void main() {
  runApp(const BlocMyApp());
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

class CubitMyApp extends StatelessWidget {
  const CubitMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => CubitQuizScreenCubit(),
        child: const CubitQuizScreen(),
      ),
    );
  }
}

class BlocMyApp extends StatelessWidget {
  const BlocMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => BlocQuizScreenBloc(),
        child: const BlocQuizScreen(),
      ),
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
