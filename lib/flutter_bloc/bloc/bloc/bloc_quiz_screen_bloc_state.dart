part of 'bloc_quiz_screen_bloc.dart';

@immutable
sealed class BlocQuizScreenBlocState {}

final class BlocQuizScreenInitial extends BlocQuizScreenBlocState {}

final class BlocQuizScreenLoader extends BlocQuizScreenBlocState {}

final class BlocQuizScreenSuccess extends BlocQuizScreenBlocState {
  final List<Widget> icons;
  final String nextQuestion;

  BlocQuizScreenSuccess({required this.icons, required this.nextQuestion});
}

final class BlocQuizScreenError extends BlocQuizScreenBlocState {
  final String? error;

  BlocQuizScreenError({required this.error});
}
