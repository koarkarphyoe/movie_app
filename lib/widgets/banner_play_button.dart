import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_fill,
      size: BANNER_PLAY_BUTTON_SIZE,
      color: PLAY_BUTTON_COLOR,
    );
  }
}
