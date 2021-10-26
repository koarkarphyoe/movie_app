// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedResponse _$TopRatedResponseFromJson(Map<String, dynamic> json) =>
    TopRatedResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopRatedResponseToJson(TopRatedResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
