import 'package:flutter/material.dart';
import 'package:BMI_Calculator/utils/ourTheme.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
