import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';


class GradientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,SCREEN_BODY_BACKGROUND_COLOR
          ],
        ),
      ),
    );
  }
}