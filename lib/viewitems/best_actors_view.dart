import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/base_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

class BestActorsView extends StatelessWidget {
  final BaseVO? mActor;

  BestActorsView({this.mActor});

  @override
  Widget build(BuildContext context) {
    String imageUrl = mActor!.profilePath != null
        ? "$actorImageBaseUrl${mActor!.profilePath.toString()}"
        : "https://w7.pngwing.com/pngs/247/564/png-transparent-computer-icons-user-profile-user-avatar-blue-heroes-electric-blue.png";

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
