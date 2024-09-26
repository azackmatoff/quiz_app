import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/services/quiz_services.dart';

class GetxQuizScreenController extends GetxController {
  RxList<Widget> icons = (List<Widget>.of([])).obs;
  RxString nextQuestion = ''.obs;

  final _servis = QuizServices();

  @override
  void onInit() {
    super.onInit();
    _getNextQuestion();
  }

  void _getNextQuestion() {
    nextQuestion.value = _servis.getNextQuestion();
    update();
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

    _getNextQuestion();
  }

  void _addIcons({
    required bool correctAnswer,
  }) {
    correctAnswer
        ? icons.add(const Icon(Icons.check, color: AppColors.white))
        : icons.add(const Icon(Icons.close, color: AppColors.secondaryColor));

    _servis.goToNextQuestion();

    update();
  }

  void reStart() {
    icons.clear();
    _servis.reStart();
    nextQuestion.value = _servis.getNextQuestion();
    update();
  }
}
