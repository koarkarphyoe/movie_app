import 'package:json_annotation/json_annotation.dart';

part 'actor_known_for_vo.g.dart';

@JsonSerializable()
class ActorKnownForVO {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;

  @JsonKey(name: "first_air_date")
  String? firstAirDate;

  @JsonKey(name: "genre_ids")
  List<int>? genreIds;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "media_type")
  String? mediaType;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "origin_country")
  List<String>? originCountry;

  @JsonKey(name: "original_language")
  String? originalLanguage;

  @JsonKey(name: "original_name")
  String? originalName;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "vote_average")
  double? voteAverage;

  @JsonKey(name: "vote_count")
  int? voteCount;

  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "video")
  bool? video;

  ActorKnownForVO(
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.mediaType,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.originalTitle,
    this.releaseDate,
    this.title,
    this.video,
  );

  factory ActorKnownForVO.fromJson(Map<String, dynamic> json) =>
      _$ActorKnownForVOFromJson(json);
  Map<String, dynamic> toJson() => _$ActorKnownForVOToJson(this);
}
