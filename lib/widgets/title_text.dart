import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';


class TitleText extends StatelessWidget {
  final text;
  TitleText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.bold,
        color: HOME_SCREEN_TITLE_TEXT_COLOR,
      ),
    );
  }
}
