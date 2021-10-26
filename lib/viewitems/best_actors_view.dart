import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

class BestActorsView extends StatelessWidget {
  final ActorVO? mActor;

  BestActorsView({this.mActor});

  @override
  Widget build(BuildContext context) {
    String imageUrl = mActor?.profilePath != null
        ? "$actorImageBaseUrl${mActor?.profilePath}"
        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxXFMfGm_rjsfmLGWEhfqWg1EAppeIZ4K0eA&usqp=CAU";
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxXFMfGm_rjsfmLGWEhfqWg1EAppeIZ4K0eA&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FavoriteIconView(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Name?",
                    "${mActor!.name}",
                    style: TextStyle(
                        fontWeight: (FontWeight.bold),
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_2X),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        size: 20,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: MARGIN_MEDIUM,
                      ),
                      Text(
                        "YOU LIKE 18 MOVIES",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HOME_SCREEN_TITLE_TEXT_COLOR,
                            fontSize: TEXT_REGULAR),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteIconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      child: Icon(
        Icons.favorite_border,
        color: Colors.white,
        size: FAVORITE_ICON_SIZE,
      ),
    );
  }
}
