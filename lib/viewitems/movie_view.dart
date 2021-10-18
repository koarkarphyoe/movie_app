import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/movie_rating_bar.dart';

class MovieView extends StatelessWidget {
  final Function onTapImage;
  final MovieVO? mMovie;
  MovieView(this.onTapImage, this.mMovie);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              onTapImage();
            },
            child: Image.network(
              "$imageBaseUrl${mMovie!.posterPath}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            "${mMovie!.title}",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: TEXT_REGULAR_2X,
                color: Colors.white),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              Text(
                "8.20",
                style: TextStyle(
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              MovieRatingBar(),
            ],
          ),
        ],
      ),
    );
  }
}
