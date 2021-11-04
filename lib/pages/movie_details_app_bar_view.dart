import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/models/movie_model_impl.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/credit_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/widgets/actors_and_creators_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/movie_rating_bar.dart';
import 'package:movie_app/widgets/title_text.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  MovieDetailsPage(this.movieId);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late final List<ActorVO> mActorList;

  MovieModel mModel = MovieModelImpl();

  MovieVO? mMovie;

  /// data bind from one endPoint and store to two variable for actor and creator ("known_for_department")
  List<CreditVO>? mActorLists;
  List<CreditVO>? mCreatorsLists;

  @override
  void initState() {
    super.initState();

    /// if you call widget level movieId variable from state object , need to use "widget."
    mModel.getMovieDetails(widget.movieId).then((value) {
      setState(() {
        mMovie = value;
      });
    });

    mModel.getCreditsByMovie(widget.movieId).then((value) {
      setState(() {
        mActorLists = value.where((element) => element.isActor()).toList();
        mCreatorsLists = value.where((element) => element.isCreator()).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> genreList = ["Family", "Fantasy", "Adventure"];
    return Scaffold(
      body: Container(
        color: SCREEN_BODY_BACKGROUND_COLOR,

        ///if mMovie not null will load data in customscrollview , if not circular loading bar will load
        child: (mMovie != null)
            ? CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    collapsedHeight: SLIVER_APP_BAR_COLLAPSED_HEIGHT,
                    expandedHeight: SLIVER_APP_BAR_EXPANDED_HEIGHT,
                    backgroundColor: PRIMARY_COLOR,
                    flexibleSpace: MovieDetailsScreenSectionView(() {
                      Navigator.pop(context);
                    }, mMovie),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          margin: EdgeInsets.only(
                              left: MARGIN_MEDIUM_LARGE,
                              bottom: MARGIN_MEDIUM_XLARGE),
                          child: Column(
                            children: [
                              MovieTimeAndGenreView(genreList: genreList),
                              SizedBox(height: MARGIN_MEDIUM_XLARGE),
                              StorylineSectionView(),
                              SizedBox(height: MARGIN_MEDIUM_LARGE),
                              PlayTrailerAndRateMovieView(),
                            ],
                          ),
                        ),
                        ActorsAndCreatorsView(
                          MOVIE_DETAILS_ACTORS,
                          "",
                          mActorList: [],
                          showMoreTextVisility: false,
                        ),
                        Container(
                          padding: EdgeInsets.all(MARGIN_MEDIUM_LARGE),
                          child: AboutFilmSectionView(),
                        ),
                        ActorsAndCreatorsView(
                          MOVIE_DETAILS_CREATORS,
                          MOVIE_DETAILS_MORE_CREATORS,
                          mActorList: [],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class AboutFilmSectionView extends StatelessWidget {
  const AboutFilmSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("ABOUT FILM"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilm("Original Title:", "X-men The Origin"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilm("Type:", "Family,Fantasy,Adventure"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilm("Production:", "United Kingdom, USA"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilm("Premiere:", "8 November 2016 (World)"),
        SizedBox(height: MARGIN_MEDIUM_2),
        AboutFilm("Description:",
            "In modern day Japan, Wolverine is out of his depth in an unknown world as he faces his ultimate nemesis in a life-or-death battle that will leave him forever changed."),
      ],
    );
  }
}

class AboutFilm extends StatelessWidget {
  final String titleText;
  final String aboutText;

  AboutFilm(this.titleText, this.aboutText);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Text(
            titleText,
            style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                color: MOVIE_DETAILS_ABOUT_FILM_TEXT),
          ),
        ),
        Expanded(
          child: Text(
            aboutText,
            style: TextStyle(fontSize: TEXT_REGULAR_3X, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class PlayTrailerAndRateMovieView extends StatelessWidget {
  const PlayTrailerAndRateMovieView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MovieDetailsScreenPlayButtonView(
            MOVIE_DETAILS_PLAY_TRAILER,
            PLAY_BUTTON_COLOR,
            Icon(
              Icons.play_circle_filled,
              color: Colors.black54,
            )),
        SizedBox(width: MARGIN_MEDIUM_LARGE),
        MovieDetailsScreenPlayButtonView(
          MOVIE_DETAILS_RATE_MOVIE,
          SCREEN_BODY_BACKGROUND_COLOR,
          Icon(
            Icons.star,
            color: PLAY_BUTTON_COLOR,
          ),
          isGhostButton: true,
        ),
      ],
    );
  }
}

class MovieDetailsScreenPlayButtonView extends StatelessWidget {
  final String titleText;
  final Color backgroundColor;
  final Icon buttonIcon;
  final bool isGhostButton;

  MovieDetailsScreenPlayButtonView(
      this.titleText, this.backgroundColor, this.buttonIcon,
      {this.isGhostButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
      height: MOVIE_DETAILS_PLAY_BUTTON_HEIGHT,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          MOVIE_DETAILS_PLAY_BUTTON_HEIGHT_2,
        ),
        border:
            isGhostButton ? (Border.all(color: Colors.white, width: 2)) : null,
      ),
      child: Center(
        child: Row(
          children: [
            buttonIcon,
            SizedBox(width: MARGIN_SMALL),
            Text(
              titleText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: TEXT_REGULAR_2X),
            ),
          ],
        ),
      ),
    );
  }
}

class StorylineSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleText(MOVIE_DETAILS_STORYLINE),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "Logan has been living a desolate life following the death of Jean Grey at his hands. A Japanese girl goes to see him, and tells him that a man he knew in World War II, and saved his life, is now dying and wants to see him. When he sees him, the man offers to make Logan mortal, but Logan refuses. Later, the man dies. At his funeral, some men try to grab the man's granddaughter.",
          style: TextStyle(color: Colors.white, fontSize: MARGIN_MEDIUM_2),
        )
      ],
    );
  }
}

class MovieTimeAndGenreView extends StatelessWidget {
  const MovieTimeAndGenreView({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, color: PLAY_BUTTON_COLOR),
        SizedBox(width: MARGIN_SMALL),
        Text(
          "2h 13min",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR_2X),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Row(
          children: genreList.map((genre) => GenreChipView(genre)).toList(),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: FAVORITE_ICON_SIZE,
          ),
        ),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreList;
  GenreChipView(this.genreList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
      child: Chip(
        label: Text(
          genreList,
          style: TextStyle(
              fontSize: TEXT_REGULAR_1X,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: MOVIE_DETAILS_GENRE_COLOR,
      ),
    );
  }
}

class MovieDetailsScreenSectionView extends StatelessWidget {
  final Function onTapBack;
  MovieVO? mMovie;
  MovieDetailsScreenSectionView(this.onTapBack, this.mMovie);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: MovieDetailsBackgroundImageView(mMovie!.posterPath.toString()),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                top: MARGIN_MEDIUM_XLARGE, left: MARGIN_MEDIUM_LARGE),
            child: MovieDetailsBackButtonView(() {
              this.onTapBack();
            }),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
                top: MARGIN_MEDIUM_XLARGE, right: MARGIN_MEDIUM_LARGE),
            child: MovieDetailsSearchIconView(),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: MARGIN_MEDIUM_LARGE,
              right: MARGIN_MEDIUM_LARGE,
              bottom: MARGIN_MEDIUM_LARGE,
            ),
            child: MovieDetailsYearAndVotesView(),
          ),
        ),
      ],
    );
  }
}

class MovieDetailsYearAndVotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              height: MOVIE_DETAILS_PLAY_BUTTON_HEIGHT,
              decoration: BoxDecoration(
                color: PLAY_BUTTON_COLOR,
                borderRadius:
                    BorderRadius.circular(MOVIE_DETAILS_PLAY_BUTTON_HEIGHT_2),
              ),
              child: MovieDeatilsYearButtonView(),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: MARGIN_MEDIUM),
                    MovieRatingBar(),
                    TitleText("38876 VOTES"),
                  ],
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "9,75",
                  style: TextStyle(
                      color: Colors.white, fontSize: MOVIE_DETAILS_RATING_TEXT),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM_XLARGE),
        MovieDetailsTitleTextView(),
      ],
    );
  }
}

class MovieDeatilsYearButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      child: Center(
        child: Text(
          "2016",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR_2X),
        ),
      ),
    );
  }
}

class MovieDetailsTitleTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "The Wolverine",
      style: TextStyle(
          fontSize: TEXT_REGULAR_5X,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    );
  }
}

class MovieDetailsSearchIconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      size: FAVORITE_ICON_SIZE,
      color: Colors.white,
    );
  }
}

class MovieDetailsBackButtonView extends StatelessWidget {
  final Function onTapBack;
  MovieDetailsBackButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBack();
      },
      child: Container(
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: FAVORITE_ICON_SIZE,
        ),
      ),
    );
  }
}

class MovieDetailsBackgroundImageView extends StatelessWidget {
  final String movieImage;
  MovieDetailsBackgroundImageView(this.movieImage);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Image.network(
        "$imageBaseUrl$movieImage",
        // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6OvuPP-6KVAnp3Ie_qKb3ucNG4ocyCuhJONTi9_wVzodGvRdJYY55WD2HRTETWFmBYg4&usqp=CAU",
        fit: BoxFit.cover,
      ),
    );
  }
}
