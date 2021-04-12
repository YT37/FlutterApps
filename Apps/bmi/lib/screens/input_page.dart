import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/brain.dart';
import '../components/card_re.dart';
import '../components/icon_name.dart';
import '../components/round_icon_button.dart';

const activeColor = 0xffeb1555;
const inactiveColor = 0xff111328;
const bgColor = 0xff1d1e33;

const labelText = TextStyle(fontSize: 18, color: Color(0xff8d8e98));

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;

  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardRe(
                      onPressed: () => setState(() => gender = Gender.Male),
                      bg: gender == Gender.Male
                          ? Color(inactiveColor)
                          : Color(bgColor),
                      cardChild: IconName(
                        icon: FontAwesomeIcons.mars,
                        nameText: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardRe(
                      onPressed: () => setState(() => gender = Gender.Female),
                      bg: gender == Gender.Male
                          ? Color(bgColor)
                          : Color(inactiveColor),
                      cardChild: IconName(
                        icon: FontAwesomeIcons.venus,
                        nameText: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardRe(
                bg: Color(bgColor),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "cm",
                          style: labelText,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8b8e98),
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 60,
                        max: 220,
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardRe(
                      bg: Color(bgColor),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelText,
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPush: () {
                                  setState(() {
                                    if (weight == 1) {
                                      weight = 1;
                                    } else {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPush: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardRe(
                      bg: Color(bgColor),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labelText,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPush: () {
                                  setState(() {
                                    if (age == 1) {
                                      age = 1;
                                    } else {
                                      age--;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPush: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              text: "CALCULATE",
              onPressed: () {
                Brain brain = Brain(height: height, weight: weight);

                String bmi = brain.bmiCalc();
                String reading = brain.getResult();
                String interpretation = brain.getInterpretation();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: bmi,
                      reading: reading,
                      interpretation: interpretation,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
