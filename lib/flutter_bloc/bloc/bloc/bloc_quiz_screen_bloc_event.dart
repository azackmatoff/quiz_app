part of 'bloc_quiz_screen_bloc.dart';

@immutable
sealed class CubitQuizScreenBlocEvent {}

class CheckUsersAnswer extends CubitQuizScreenBlocEvent {
  final bool usersAnswer;
  final Function() reStart;

  CheckUsersAnswer({required this.usersAnswer, required this.reStart});
}

class GetNextQuestion extends CubitQuizScreenBlocEvent {
  final List<Widget> icons;

  GetNextQuestion({required this.icons});
}

class Restart extends CubitQuizScreenBlocEvent {}
