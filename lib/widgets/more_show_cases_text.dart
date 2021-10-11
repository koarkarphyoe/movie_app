import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';

class MoreShowCases extends StatelessWidget {
  final String text;
  final Color textColor;
  MoreShowCases (this.text,{this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR_2X,
              color: textColor,
              decoration: TextDecoration.underline),
        ),
    );
  }
}
