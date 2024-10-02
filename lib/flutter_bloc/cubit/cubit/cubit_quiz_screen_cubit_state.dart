part of 'cubit_quiz_screen_cubit.dart';

@immutable
sealed class CubitQuizScreenCubitState {}

final class CubitQuizScreenInitial extends CubitQuizScreenCubitState {}

final class CubitQuizScreenLoader extends CubitQuizScreenCubitState {}

final class CubitQuizScreenSuccess extends CubitQuizScreenCubitState {
  final List<Widget> icons;
  final String nextQuestion;

  CubitQuizScreenSuccess({required this.icons, required this.nextQuestion});
}

final class CubitQuizScreenError extends CubitQuizScreenCubitState {
  final String? error;

  CubitQuizScreenError({required this.error});
}
