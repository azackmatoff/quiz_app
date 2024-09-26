import 'package:flutter/material.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/services/quiz_services.dart';

class PrvQuizScreenProvider extends ChangeNotifier {
  List<Widget> icons = [];
  late String nextQuestion;

  // PrvQuizScreenProvider() {
  //   getNextQuestion();
  // }

  void init() {
    getNextQuestion();
  }

  final _servis = QuizServices();

  void getNextQuestion() {
    nextQuestion = _servis.getNextQuestion();
    notifyListeners();
  }

  void checkUsersAnswer({
    required bool usersAnswer,
    required Function() reStart,
  }) {
    final isFinished = _servis.checkFinished();
    final correctAnswer = _servis.getCorrectAnswer();

    if (isFinished == true) {
      _addIcons(correctAnswer: correctAnswer == usersAnswer);
      reStart.call();
    } else {
      correctAnswer == usersAnswer
          ? _addIcons(correctAnswer: true)
          : _addIcons(correctAnswer: false);
    }

    getNextQuestion();
  }

  void _addIcons({
    required bool correctAnswer,
  }) {
    correctAnswer
        ? icons.add(const Icon(Icons.check, color: AppColors.white))
        : icons.add(const Icon(Icons.close, color: AppColors.secondaryColor));

    _servis.goToNextQuestion();

    notifyListeners();
  }

  void reStart() {
    icons.clear();
    _servis.reStart();
    nextQuestion = _servis.getNextQuestion();
    notifyListeners();
  }
}
