import 'package:flutter/material.dart';

import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/widgets/custom_button.dart';
import 'package:quiz_app/flutter_way/business_logic/quiz_screen_biz_logic.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizScreenBizLogic _bizLogic = QuizScreenBizLogic();

  @override
  Widget build(BuildContext context) {
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
                _bizLogic.getNextQuestion(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  CustomButton(
                    onPressed: () => _bizLogic.checkUsersAnswer(
                      usersAnswer: true,
                      reStart: () {
                        _showRestartBottomSheet();
                      },
                      setState: () {
                        setState(() {});
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
                    onPressed: () => _bizLogic.checkUsersAnswer(
                      usersAnswer: false,
                      reStart: () {
                        _showRestartBottomSheet();
                      },
                      setState: () {
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      children: _bizLogic.icons,
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

  void _showRestartBottomSheet() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Suroolor buttu'),
          content: const SingleChildScrollView(
            child: Text('Kayradan bashta'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                _bizLogic.reStart(
                  setState: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
