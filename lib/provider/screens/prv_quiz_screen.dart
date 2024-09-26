import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/widgets/custom_button.dart';
import 'package:quiz_app/provider/providers/prv_quiz_screen_provider.dart';

class PrvQuizScreen extends StatelessWidget {
  const PrvQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Consumer<PrvQuizScreenProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    provider.nextQuestion,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      CustomButton(
                        onPressed: () => provider.checkUsersAnswer(
                          usersAnswer: true,
                          reStart: () {
                            _showRestartBottomSheet(context);
                          },
                        ),
                        buttonStyle:
                            Theme.of(context).elevatedButtonTheme.style!.copyWith(
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
                        onPressed: () => provider.checkUsersAnswer(
                          usersAnswer: false,
                          reStart: () {
                            _showRestartBottomSheet(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Row(
                          children: provider.icons,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _showRestartBottomSheet(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Suroolor buttu'),
          content: const SingleChildScrollView(
            child: Text('Kayradan bashta'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                context.read<PrvQuizScreenProvider>().reStart();
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
