import 'dart:math';

class Brain {
  final int weight;
  final int height;

  Brain({required this.weight, required this.height});

  late double _bmi;

  String bmiCalc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return "OVERWEIGHT";
    else if (_bmi > 18.5)
      return "NORMAL";
    else
      return "UNDERWEIGHT";
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return "Your BMI is too high, Exercise More!";
    else if (_bmi > 18.5)
      return "Your BMI is Normal, No issues there";
    else
      return "Your BMI is too less, Eat More!";
  }
}
