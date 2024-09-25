import 'package:flutter/material.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/services/quiz_services.dart';

class QuizScreenBizLogic {
  List<Widget> icons = [];

  final _servis = QuizServices();

  String getNextQuestion() {
    return _servis.getNextQuestion();
  }

  void checkUsersAnswer({
    required bool usersAnswer,
    required Function() reStart,
    required Function() setState,
  }) {
    final isFinished = _servis.checkFinished();
    final correctAnswer = _servis.getCorrectAnswer();

    if (isFinished == true) {
      _addIcons(correctAnswer: correctAnswer == usersAnswer, setState: setState);
      reStart.call();
    } else {
      correctAnswer == usersAnswer
          ? _addIcons(correctAnswer: true, setState: setState)
          : _addIcons(correctAnswer: false, setState: setState);
    }
  }

  void _addIcons({
    required bool correctAnswer,
    required Function() setState,
  }) {
    correctAnswer
        ? icons.add(const Icon(Icons.check, color: AppColors.white))
        : icons.add(const Icon(Icons.close, color: AppColors.secondaryColor));

    _servis.goToNextQuestion();

    setState.call();
  }

  void reStart({
    required Function() setState,
  }) {
    icons.clear();
    _servis.reStart();
    setState.call();
  }
}
