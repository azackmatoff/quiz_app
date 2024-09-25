import 'package:quiz_app/common/models/question.dart';

class QuizServices {
  int index = 0;
  final List<Question> _questions = [
    const Question(text: 'Kyrgyzstandyn borboru Bishkek', correctAnswer: true), // 0
    const Question(
        text: 'Duynodogu en biyik too Ala-Too', correctAnswer: false), // 1
    const Question(text: '2+2=5', correctAnswer: false), // 2
    const Question(text: '10+1 = 11', correctAnswer: true), // 3
    const Question(text: '1+1=3', correctAnswer: false), //4
    const Question(text: '1+1=2', correctAnswer: true), //5
  ];

  String getNextQuestion() {
    return _questions[index].text;
  }

  bool getCorrectAnswer() {
    return _questions[index].correctAnswer;
  }

  void goToNextQuestion() {
    if (index < _questions.length - 1) {
      index++;
    }
  }

  bool checkFinished() {
    return index == _questions.length - 1;
  }

  void reStart() {
    index = 0;
  }
}
