// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorVO _$ActorVOFromJson(Map<String, dynamic> json) => ActorVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      (json['known_for'] as List<dynamic>?)
          ?.map((e) => ActorKnownForVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['known_for_department'] as String?,
      json['name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorVOToJson(ActorVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };