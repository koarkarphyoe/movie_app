import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/movie_rating_bar.dart';

class MovieView extends StatelessWidget {
  final Function onTapImage;
  MovieView(this.onTapImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              onTapImage();
            },
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnt0bHvCWQmOoCieTbnBya250f4A2G1TCr1HWHD929LxSft_hhGAsWw3FbjTLN3JjVvcE&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            "Westworld",
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
