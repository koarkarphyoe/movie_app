import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/banner_play_button.dart';
import 'package:movie_app/widgets/gradient_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        ),
      ],
    );
  }
}



class BannerTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The Wolverine 2013.",
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

class BannerImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnt0bHvCWQmOoCieTbnBya250f4A2G1TCr1HWHD929LxSft_hhGAsWw3FbjTLN3JjVvcE&usqp=CAU",
      fit: BoxFit.cover,
    );
  }
}
