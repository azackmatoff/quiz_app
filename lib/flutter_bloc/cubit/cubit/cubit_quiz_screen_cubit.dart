import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/services/quiz_services.dart';

part 'cubit_quiz_screen_cubit_state.dart';

class CubitQuizScreenCubit extends Cubit<CubitQuizScreenCubitState> {
  CubitQuizScreenCubit() : super(CubitQuizScreenLoader());

  final _servis = QuizServices();

  void getNextQuestion(List<Widget> icons) {
    final nextQuestion = _servis.getNextQuestion();

    emit(CubitQuizScreenSuccess(icons: icons, nextQuestion: nextQuestion));
  }

  void checkUsersAnswer({
    required bool usersAnswer,
    required Function() reStart,
  }) {
    final isFinished = _servis.checkFinished();
    final correctAnswer = _servis.getCorrectAnswer();

    Widget icon = const SizedBox();

    if (isFinished == true) {
      icon = _addIcons(correctAnswer: correctAnswer == usersAnswer);
      reStart.call();
    } else {
      icon = correctAnswer == usersAnswer ? _addIcons(correctAnswer: true) : _addIcons(correctAnswer: false);
    }
    final icons = List<Widget>.from((state as CubitQuizScreenSuccess).icons); // Create a modifiable list
    icons.add(icon); // Add the new icon to the list
    getNextQuestion(icons); // Pass the modifiable list to the function
  }

  Widget _addIcons({
    required bool correctAnswer,
  }) {
    final icon = correctAnswer
        ? const Icon(Icons.check, color: AppColors.white)
        : const Icon(Icons.close, color: AppColors.secondaryColor);

    _servis.goToNextQuestion();

    return icon;
  }

  void reStart() {
    _servis.reStart();
    final nextQuestion = _servis.getNextQuestion();

    emit(CubitQuizScreenSuccess(icons: const <Widget>[], nextQuestion: nextQuestion));
  }
}
