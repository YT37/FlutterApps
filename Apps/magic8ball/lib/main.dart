import 'package:flutter/material.dart';

import './screens/ball.dart';

void main() => runApp(MaterialApp(home: Magic8Ball()));

class Magic8Ball extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BallPage(),
    );
  }
}
