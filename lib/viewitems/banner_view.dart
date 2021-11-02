import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/banner_play_button.dart';
import 'package:movie_app/widgets/gradient_view.dart';

class BannerView extends StatelessWidget {
  final MovieVO? mResults;

  BannerView(this.mResults);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(mResults: mResults),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(mResults: mResults),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        ),
      ],
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    Key? key,
    required this.mResults,
  }) : super(key: key);

  final MovieVO? mResults;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$imageBaseUrl${mResults!.posterPath}",
      fit: BoxFit.cover,
    );
  }
}

class BannerTitleView extends StatelessWidget {
  final MovieVO? mResults;
  BannerTitleView({this.mResults});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${mResults!.originalTitle}",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_HEADING_1X),
          ),
          Text(
            "Official Review.",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_HEADING_1X),
          ),
        ],
      ),
    );
  }
}
