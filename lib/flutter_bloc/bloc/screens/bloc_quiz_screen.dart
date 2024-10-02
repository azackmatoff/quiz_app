import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/widgets/custom_button.dart';
import 'package:quiz_app/flutter_bloc/bloc/bloc/bloc_quiz_screen_bloc.dart';

class BlocQuizScreen extends StatefulWidget {
  const BlocQuizScreen({super.key});

  @override
  _BlocQuizScreenState createState() => _BlocQuizScreenState();
}

class _BlocQuizScreenState extends State<BlocQuizScreen> {
  @override
  void initState() {
    super.initState();

    context.read<BlocQuizScreenBloc>().add(GetNextQuestion(icons: const <Widget>[]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocQuizScreenBloc, BlocQuizScreenBlocState>(
      builder: (context, state) {
        if (state is BlocQuizScreenLoader) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is BlocQuizScreenSuccess) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      state.nextQuestion,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            context.read<BlocQuizScreenBloc>().add(
                                  CheckUsersAnswer(
                                    usersAnswer: true,
                                    reStart: () {
                                      _showRestartBottomSheet();
                                    },
                                  ),
                                );
                          },
                          buttonStyle: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  AppColors.green,
                                ),
                              ),
                          text: 'TRUE',
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'FALSE',
                          buttonStyle: Theme.of(context).elevatedButtonTheme.style!,
                          onPressed: () {
                            context.read<BlocQuizScreenBloc>().add(
                                  CheckUsersAnswer(
                                    usersAnswer: false,
                                    reStart: () {
                                      _showRestartBottomSheet();
                                    },
                                  ),
                                );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Row(
                            children: state.icons,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  void _showRestartBottomSheet() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (cntx) {
        return AlertDialog(
          title: const Text('Suroolor buttu'),
          content: const SingleChildScrollView(
            child: Text('Kayradan bashta'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                context.read<BlocQuizScreenBloc>().add(Restart());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
