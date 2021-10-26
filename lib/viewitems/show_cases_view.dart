import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/banner_play_button.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCasesView extends StatelessWidget {
  final MovieVO? topRated;
  ShowCasesView(this.topRated);

  @override
  Widget build(BuildContext context) {
    String imageUrl = topRated?.posterPath != null
        ? "$imageBaseUrl${topRated!.posterPath}"
        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnt0bHvCWQmOoCieTbnBya250f4A2G1TCr1HWHD929LxSft_hhGAsWw3FbjTLN3JjVvcE&usqp=CAU";
    return Container(
      width: SHOW_CASES_VIEW_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          ImageView(imageUrl: imageUrl),
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
                    "${topRated!.title}",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_4X,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TitleText("${topRated!.releaseDate}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
