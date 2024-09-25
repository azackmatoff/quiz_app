import 'package:flutter/material.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final String text;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonStyle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
