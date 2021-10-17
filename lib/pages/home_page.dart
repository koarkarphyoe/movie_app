import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/models/movie_model_impl.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewitems/banner_view.dart';
import 'package:movie_app/viewitems/movie_view.dart';
import 'package:movie_app/viewitems/show_cases_view.dart';
import 'package:movie_app/widgets/actors_and_creators_view.dart';
import 'package:movie_app/widgets/more_show_cases_text.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:movie_app/widgets/title_text_with_more_show_cases.dart';

import 'movie_details_app_bar_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieModel mModel = MovieModelImpl();

  List<String> genreList = [
    "Action",
    "Adventure",
    "Horror",
    "Comedy",
    "Thriller",
    "Drama",
  ];

  List<MovieVO>? mNowPlayingMovieList;
  // int? a;

  @override
  void initState() {
    super.initState();
    // print(a! + 1);

    mModel.getNowPlayingMovies(1).then((movieList) {
      setState(() {
        mNowPlayingMovieList != movieList;
      });
    }).catchError((error) {
      debugPrint("Error ===> ${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        title: Text(
          MAIN_SCREEN_APP_BAR_TITLE,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 0, top: 0, right: MARGIN_MEDIUM_2, bottom: 0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: SCREEN_BODY_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSectionView(),
              SizedBox(height: MARGIN_MEDIUM),
              BestPopularMoviesAndSerialsSectionView(
                  () => _navigateToMovieDetailsPage(context),
                  mNowPlayingMovieList!),
              SizedBox(height: MARGIN_MEDIUM),
              MovieShowtimesSectionView(),
              SizedBox(height: MARGIN_MEDIUM),
              GenreSectionView(() => _navigateToMovieDetailsPage(context),
                  genreList: genreList),
              SizedBox(height: MARGIN_MEDIUM),
              ShowCasesSectionView(),
              SizedBox(height: MARGIN_MEDIUM_XLARGE),
              ActorsAndCreatorsView(BEST_ACTORS_TEXT, MORE_ACTORS_TEXT),
              SizedBox(height: MARGIN_MEDIUM),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToMovieDetailsPage(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsPage(),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  final Function onTapImage;

  const GenreSectionView(
    this.onTapImage, {
    Key? key,
    required this.genreList,
  }) : super(key: key);
  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: genreList.length,
          child: TabBar(
            isScrollable: true,
            indicatorColor: PLAY_BUTTON_COLOR,
            unselectedLabelColor: HOME_SCREEN_TITLE_TEXT_COLOR,
            tabs: genreList
                .map(
                  (genre) => Tab(
                    child: Text(genre),
                  ),
                )
                .toList(),
          ),
        ),
        HorizontalMovieListView(
          () {
            onTapImage();
          },
          mMovieList: [],
        ),
      ],
    );
  }
}

class MovieShowtimesSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_SHOWTIMES_HEIGHT,
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_LARGE),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  HOME_SCREEN_MOVIE_SHOWTIMES,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SHOWTIMES_TEXT),
                ),
                Spacer(),
                MoreShowCases(
                  HOME_SCREEN_MOVIE_SHOWTIMES_SEE_MORE,
                  textColor: PLAY_BUTTON_COLOR,
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.location_on_rounded,
              size: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class ShowCasesSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithMoreShowCases(
                SHOW_CASE_TITLE_TEXT, MORE_SHOW_CASE_TITLE_TEXT),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Container(
            height: MOVIE_LIST_HEIGHT,
            child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: [
                ShowCasesView(),
                ShowCasesView(),
                ShowCasesView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestPopularMoviesAndSerialsSectionView extends StatelessWidget {
  final Function onTapImage;
  final List<MovieVO> mMovieList;
  BestPopularMoviesAndSerialsSectionView(this.onTapImage, this.mMovieList);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: (TitleText(HOME_SCREEN_MOVIE_TITLE_TEXT)),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        HorizontalMovieListView(() {
          onTapImage();
        }, mMovieList: mMovieList)
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function onTapImage;
  final List<MovieVO> mMovieList;
  HorizontalMovieListView(this.onTapImage, {required this.mMovieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      height: MOVIE_LIST_HEIGHT,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM),
        // ignore: unnecessary_null_comparison
        child: (mMovieList != null)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                itemCount: mMovieList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieView(() {
                    onTapImage();
                  }, mMovieList[index]);
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class BannerSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: PageView(
            children: [
              BannerView(),
              BannerView(),
            ],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
              activeColor: PLAY_BUTTON_COLOR,
              color: DOTS_INDICATOR_INACTIVE_COLOR),
        )
      ],
    );
  }
}
