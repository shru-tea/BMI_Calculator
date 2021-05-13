import 'package:BMI_Calculator/utils/calculator.dart';
import 'package:BMI_Calculator/widgets/IconWidget.dart';
import 'package:BMI_Calculator/widgets/ourButton.dart';
import 'package:BMI_Calculator/widgets/ourContainer.dart';
import 'package:BMI_Calculator/widgets/roundIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results.dart';

enum genderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType selectedGender;
  int height = 180;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: OurContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.male;
                      });
                    },
                    cardColor: selectedGender == genderType.male
                        ? Theme.of(context).cardColor
                        : Theme.of(context).focusColor,
                    cardChild:
                        OurIcon(ourIcon: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: OurContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.female;
                      });
                    },
                    cardColor: selectedGender == genderType.female
                        ? Theme.of(context).cardColor
                        : Theme.of(context).focusColor,
                    cardChild: OurIcon(
                        ourIcon: FontAwesomeIcons.venus, gender: 'FEMALE'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: OurContainer(
              cardColor: Theme.of(context).cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Theme.of(context).dividerColor,
                        activeTrackColor: Colors.white,
                        thumbColor: Theme.of(context).accentColor,
                        overlayColor:
                            Theme.of(context).accentColor.withAlpha(20),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
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
                  child: OurContainer(
                    cardColor: Theme.of(context).cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          weight.toString(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              childIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: OurContainer(
                    cardColor: Theme.of(context).cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          age.toString(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              childIcon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childIcon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          OurButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculateBMI calc = CalculateBMI(height: height, weight: weight);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResults(),
                        interpretationText: calc.getInterpretation(),
                      )));
            },
          )
        ],
      ),
    );
  }
}
