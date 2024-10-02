import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/widgets/custom_button.dart';
import 'package:quiz_app/flutter_bloc/cubit/cubit/cubit_quiz_screen_cubit.dart';

class CubitQuizScreen extends StatefulWidget {
  const CubitQuizScreen({super.key});

  @override
  _CubitQuizScreenState createState() => _CubitQuizScreenState();
}

class _CubitQuizScreenState extends State<CubitQuizScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CubitQuizScreenCubit>().getNextQuestion(const <Widget>[]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitQuizScreenCubit, CubitQuizScreenCubitState>(
      builder: (context, state) {
        if (state is CubitQuizScreenLoader) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CubitQuizScreenSuccess) {
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
                          onPressed: () => context.read<CubitQuizScreenCubit>().checkUsersAnswer(
                                usersAnswer: true,
                                reStart: () {
                                  _showRestartBottomSheet();
                                },
                              ),
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
                          onPressed: () => context.read<CubitQuizScreenCubit>().checkUsersAnswer(
                                usersAnswer: false,
                                reStart: () {
                                  _showRestartBottomSheet();
                                },
                              ),
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
                context.read<CubitQuizScreenCubit>().reStart();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
