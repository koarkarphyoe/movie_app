import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/home_bloc.dart';
import 'package:movie_app/data.vos/models/movie_model.dart';
import 'package:movie_app/data.vos/models/movie_model_impl.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
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
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
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
              ///Need to care banner count! => mResults?.take(8).toList()
              StreamBuilder(
                stream: _bloc.mNowPlayingMovieListStreamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<MovieVO>?> snapshot) {
                  return BannerSectionView(
                    mPopularMovieList: snapshot.data?.take(8).toList() ?? [],
                  );
                },
              ),
              SizedBox(height: MARGIN_MEDIUM),
              StreamBuilder(
                stream: _bloc.mPopularMovieListStreamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<MovieVO>?> snapshot) {
                  return BestPopularMoviesAndSerialsSectionView(
                    (movieId) => _navigateToMovieDetailsPage(context, movieId),
                    snapshot.data,
                  );
                },
              ),
              SizedBox(height: MARGIN_MEDIUM),
              MovieShowtimesSectionView(),
              SizedBox(height: MARGIN_MEDIUM),
              StreamBuilder(
                stream: _bloc.mGenreListStreamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<GenreVO>?> genreSnapshot) {
                  return StreamBuilder(
                    stream: _bloc.mMovieByGenreStreamController.stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MovieVO>?> movieByGenreSnapshot) {
                      return GenreSectionView(
                        (movieId) =>
                            _navigateToMovieDetailsPage(context, movieId),
                        genreSnapshot.data,
                        movieByGenreSnapshot.data,
                        onTapGenre: (int genreId) {
                          _bloc.getMoviesGenreAndRefresh(genreId);
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: MARGIN_MEDIUM),
              StreamBuilder(
                stream: _bloc.topRatedStreamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<MovieVO>?> snapshot) {
                  return ShowCasesSectionView(snapshot.data);
                },
              ),
              SizedBox(height: MARGIN_MEDIUM_XLARGE),
              StreamBuilder(
                stream: _bloc.mActorListStreamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ActorVO>?> snapshot) {
                  return ActorsAndCreatorsView(
                    BEST_ACTORS_TEXT,
                    MORE_ACTORS_TEXT,
                    mActorList: snapshot.data,
                  );
                },
              ),
              SizedBox(height: MARGIN_MEDIUM),
            ],
          ),
        ),
      ),
    );
  }

  _navigateToMovieDetailsPage(BuildContext context, int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsPage(movieId),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  final Function onTapImage;
  // final List<String> genreList;
  final List<GenreVO>? mGenreList;
  final List<MovieVO>? movieList;
  final Function(int) onTapGenre;
  // final List<String> genreList = ["Action", "Thriller"];

  GenreSectionView(
    this.onTapImage,
    this.mGenreList,
    this.movieList, {
    Key? key,
    required this.onTapGenre,
    // required this.genreList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: mGenreList?.length ?? 0,
          child: TabBar(
            onTap: (index) {
              this.onTapGenre(mGenreList![index].id);
            },
            isScrollable: true,
            indicatorColor: PLAY_BUTTON_COLOR,
            unselectedLabelColor: HOME_SCREEN_TITLE_TEXT_COLOR,
            tabs: mGenreList
                    ?.map(
                      (genre) => Tab(
                        child: Text(genre.name),
                      ),
                    )
                    .toList() ??
                [],
          ),
        ),
        HorizontalMovieListView((movieId) {
          onTapImage(movieId);
        }, mMovieList: movieList),
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
  final List<MovieVO>? topRated;

  ShowCasesSectionView(this.topRated);

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
              children: topRated?.map((e) => ShowCasesView(e)).toList() ?? [],
            ),
          ),
        ],
      ),
    );
  }
}

class BestPopularMoviesAndSerialsSectionView extends StatelessWidget {
  final Function(int) onTapImage;
  final List<MovieVO>? mMovieList;

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
        HorizontalMovieListView(
          (movieId) {
            onTapImage(movieId);
          },
          mMovieList: mMovieList,
        )
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int) onTapImage;
  final List<MovieVO>? mMovieList;

  HorizontalMovieListView(
    this.onTapImage, {
    required this.mMovieList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      height: MOVIE_LIST_HEIGHT,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM),
        child: (mMovieList != null)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                itemCount: mMovieList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return MovieView((movieId) {
                    this.onTapImage(movieId);
                  }, mMovieList?[index]);
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  final List<MovieVO>? mPopularMovieList;
  BannerSectionView({this.mPopularMovieList});

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: widget.mPopularMovieList
                    ?.map((movie) => BannerView(movie))
                    .toList() ??
                [],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        DotsIndicator(
          dotsCount: 8,
          position: _position,
          mainAxisSize: MainAxisSize.max,
          decorator: DotsDecorator(
              size: Size.square(5.0),
              activeSize: Size.square(15.0),
              activeColor: PLAY_BUTTON_COLOR,
              color: DOTS_INDICATOR_INACTIVE_COLOR),
        )
      ],
    );
  }
}
