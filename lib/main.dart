import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/data.vos/vos/actor_vo.dart';
import 'package:movie_app/data.vos/vos/base_vo.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
import 'package:movie_app/data.vos/vos/spoken_language_vo.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';

import 'data.vos/vos/collection_vo.dart';
import 'data.vos/vos/credit_vo.dart';
import 'data.vos/vos/date_vo.dart';
import 'data.vos/vos/genre_vo.dart';
import 'data.vos/vos/production_company_vo.dart';
import 'data.vos/vos/production_country_vo.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ActorVOAdapter());
  Hive.registerAdapter(BaseVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(CreditVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());

  await Hive.openBox<ActorVO>(boxName_ActorVO);
  await Hive.openBox<MovieVO>(boxName_MovieVO);
  await Hive.openBox<GenreVO>(boxName_GenreVO);
  await Hive.openBox<CreditVO>(boxName_CreditVO);
  // to check network data
  // MovieModelImpl()
  //     .getNowPlayingMovies(1)
  //     .then((value) => value.map((e) => print(e.posterPath)).toList());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
