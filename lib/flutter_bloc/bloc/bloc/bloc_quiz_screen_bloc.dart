import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/services/quiz_services.dart';

part 'bloc_quiz_screen_bloc_event.dart';
part 'bloc_quiz_screen_bloc_state.dart';

class BlocQuizScreenBloc extends Bloc<CubitQuizScreenBlocEvent, BlocQuizScreenBlocState> {
  final _servis = QuizServices();

  BlocQuizScreenBloc() : super(BlocQuizScreenLoader()) {
    on<CubitQuizScreenBlocEvent>((event, emit) {
      /// funksiyalar jazilat
    });

    /// uzun jolu
    // on<CheckUsersAnswer>((event, emit) {
    //   _onCheckUsersAnswer(event, emit);
    // });

    /// kiska jolu
    on<CheckUsersAnswer>(_onCheckUsersAnswer);
    on<GetNextQuestion>(_onGetNextQuestion);
    on<Restart>(_onRestart);
  }

  void _onCheckUsersAnswer(CheckUsersAnswer event, Emitter<BlocQuizScreenBlocState> emit) {
    final isFinished = _servis.checkFinished();
    final correctAnswer = _servis.getCorrectAnswer();

    Widget icon = const SizedBox();

    if (isFinished == true) {
      icon = _addIcons(correctAnswer: correctAnswer == event.usersAnswer);
      event.reStart.call();
    } else {
      icon = correctAnswer == event.usersAnswer
          ? _addIcons(correctAnswer: true)
          : _addIcons(correctAnswer: false);
    }
    final icons = List<Widget>.from((state as BlocQuizScreenSuccess).icons); // Create a modifiable list
    icons.add(icon); // Add the new icon to the list
    _getNextQuestion(icons, emit); // Pass the modifiable list to the function
  }

  void _onGetNextQuestion(GetNextQuestion event, Emitter<BlocQuizScreenBlocState> emit) {
    _getNextQuestion(event.icons, emit);
  }

  void _onRestart(Restart event, Emitter<BlocQuizScreenBlocState> emit) {
    _servis.reStart();
    final nextQuestion = _servis.getNextQuestion();
    emit(BlocQuizScreenSuccess(icons: const <Widget>[], nextQuestion: nextQuestion));
  }

  void _getNextQuestion(List<Widget> icons, Emitter<BlocQuizScreenBlocState> emit) {
    final nextQuestion = _servis.getNextQuestion();
    emit(BlocQuizScreenSuccess(icons: icons, nextQuestion: nextQuestion));
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
}
