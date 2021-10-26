// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPopularMoviesResponse _$GetPopularMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    GetPopularMoviesResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => ResultsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPopularMoviesResponseToJson(
        GetPopularMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
