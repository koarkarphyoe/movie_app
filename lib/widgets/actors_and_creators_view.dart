import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewitems/best_actors_view.dart';
import 'package:movie_app/widgets/title_text_with_more_show_cases.dart';

class ActorsAndCreatorsView extends StatelessWidget {
  late final String titleText;
  late final String showMoreText;
  late final bool showMoreTextVisility;

  ActorsAndCreatorsView(this.titleText, this.showMoreText,
      {this.showMoreTextVisility = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
            child:
                TitleTextWithMoreShowCases(titleText, showMoreText),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Container(
            height: MOVIE_LIST_HEIGHT,
            child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: [
                BestActorsView(),
                BestActorsView(),
                BestActorsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
