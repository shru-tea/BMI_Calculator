import 'package:BMI_Calculator/input_page.dart';
import 'package:BMI_Calculator/widgets/ourButton.dart';
import 'package:BMI_Calculator/widgets/ourContainer.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretationText});
  final String bmiResult;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: OurContainer(
              cardColor: Theme.of(context).cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    bmiResult,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    interpretationText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
          ),
          OurButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InputPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
