import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/banner_play_button.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCasesView extends StatelessWidget {
  const ShowCasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SHOW_CASES_VIEW_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnt0bHvCWQmOoCieTbnBya250f4A2G1TCr1HWHD929LxSft_hhGAsWw3FbjTLN3JjVvcE&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Passengers",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_4X,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TitleText("15 DECEMBER 2013"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
