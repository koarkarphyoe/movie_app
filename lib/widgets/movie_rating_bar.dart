import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingBar extends StatelessWidget {
  const MovieRatingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3.0,
      itemSize: 20,
      itemBuilder: (BuildContext context, int index) {
        return Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
