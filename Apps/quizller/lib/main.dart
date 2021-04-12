import 'package:flutter/material.dart';

import './screens/quiz.dart';

void main() => runApp(Quizzeler());

class Quizzeler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}
