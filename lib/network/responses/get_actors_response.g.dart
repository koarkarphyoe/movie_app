// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_actors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActorsResponse _$GetActorsResponseFromJson(Map<String, dynamic> json) =>
    GetActorsResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetActorsResponseToJson(GetActorsResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
