import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';
import 'package:quiz_app/common/widgets/custom_button.dart';
import 'package:quiz_app/getx/controller/getx_quiz_screen_controller.dart';

class GetxQuizScreen extends StatelessWidget {
  GetxQuizScreen({super.key});

  final GetxQuizScreenController _controller = Get.put(GetxQuizScreenController());

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
              Obx(() {
                return Text(
                  _controller.nextQuestion.value,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                );
              }),
              Column(
                children: [
                  CustomButton(
                    onPressed: () => _controller.checkUsersAnswer(
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
                    onPressed: () => _controller.checkUsersAnswer(
                      usersAnswer: false,
                      reStart: () {
                        _showRestartBottomSheet(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Obx(
                      () {
                        if (_controller.icons.isEmpty) {
                          return const SizedBox();
                        }
                        return Row(
                          children: _controller.icons,
                        );
                      },
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

  void _showRestartBottomSheet(BuildContext context) {
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
                _controller.reStart();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
