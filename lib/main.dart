import 'package:flutter/material.dart';
import 'package:movie_app/network/http_movie_data_agent_impl.dart';
import 'package:movie_app/network/retrofit_data_agent_impl.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_details_app_bar_view.dart';

import 'network/dio_movie_data_agent_impl.dart';

void main() {
  RetrofitDataAgentImpl().getNowPlayingMovies(1);
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
