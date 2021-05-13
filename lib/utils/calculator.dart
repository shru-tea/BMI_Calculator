import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal BMI. Try to exercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a normal BMI. Good job!';
    } else {
      return 'You have a lower than normal BMI. You should eat a bit more';
    }
  }
}
