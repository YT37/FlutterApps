import 'dart:math';

import 'package:flutter/material.dart';

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Ask Me Anything",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () =>
                      setState(() => ballNo = Random().nextInt(5) + 1),
                  child: Image.asset("images/ball$ballNo.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
