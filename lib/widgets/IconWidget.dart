import 'package:flutter/material.dart';

class OurIcon extends StatelessWidget {
  OurIcon({this.gender, this.ourIcon});
  final String gender;
  final IconData ourIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ourIcon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gender, style: Theme.of(context).textTheme.headline6),
      ],
    );
  }
}
