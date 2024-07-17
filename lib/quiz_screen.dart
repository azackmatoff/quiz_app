import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
                'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  knopkaniKur(
                    text: 'TRUE',
                    style: Theme.of(context).elevatedButtonTheme.style!,
                  ),
                  const SizedBox(height: 24),
                  knopkaniKur(
                    text: 'FALSE',
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.red,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.white,
                          ),
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.check),
                        Icon(Icons.check),
                        Icon(Icons.check),
                        Icon(Icons.close, color: Colors.red),
                        Icon(Icons.close, color: Colors.red),
                        Icon(Icons.close, color: Colors.red),
                      ],
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

  Widget knopkaniKur({
    required String text,
    required ButtonStyle style,
  }) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: style,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
