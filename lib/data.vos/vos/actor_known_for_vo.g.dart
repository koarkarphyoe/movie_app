// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_known_for_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorKnownForVO _$ActorKnownForVOFromJson(Map<String, dynamic> json) =>
    ActorKnownForVO(
      json['backdrop_path'] as String?,
      json['first_air_date'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['media_type'] as String?,
      json['name'] as String?,
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['original_language'] as String?,
      json['original_name'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      json['adult'] as bool?,
      json['original_title'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
    );

Map<String, dynamic> _$ActorKnownForVOToJson(ActorKnownForVO instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'name': instance.name,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'adult': instance.adult,
      'original_title': instance.originalTitle,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
    };
