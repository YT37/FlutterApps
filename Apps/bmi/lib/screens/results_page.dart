import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/card_re.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String reading;
  final String interpretation;

  ResultPage({
    @required this.result,
    @required this.reading,
    @required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result : ",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardRe(
                bg: Color(0xff1d1e33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      reading,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff24d876)),
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      interpretation.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              text: "RECALCULATE",
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
