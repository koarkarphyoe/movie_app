import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/vos/collection_vo.dart';
import 'package:movie_app/data.vos/vos/genre_vo.dart';
import 'package:movie_app/data.vos/vos/production_company_vo.dart';
import 'package:movie_app/data.vos/vos/production_country_vo.dart';
import 'package:movie_app/data.vos/vos/spoken_language_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_MovieVO, adapterName: "MovieVOAdapter")
class MovieVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: "belongs_to_collection")
  @HiveField(2)
  CollectionVO? belongsToCollection;

  @JsonKey(name: "budget")
  @HiveField(3)
  int? budget;

  @JsonKey(name: "genres")
  @HiveField(4)
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  @HiveField(5)
  String? homepage;

  @JsonKey(name: "genre_ids")
  @HiveField(6)
  List<int>? genreIds;

  @JsonKey(name: "id")
  @HiveField(7)
  int? id;

  @JsonKey(name: "imdb_id")
  @HiveField(8)
  String? imdbId;

  @JsonKey(name: "original_language")
  @HiveField(9)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(10)
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(11)
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(12)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(13)
  String? posterPath;

  @JsonKey(name: "production_companies")
  @HiveField(14)
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @HiveField(15)
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "release_date")
  @HiveField(16)
  String? releaseDate;

  @JsonKey(name: "revenue")
  @HiveField(17)
  int? revenue;

  @JsonKey(name: "runtime")
  @HiveField(18)
  int? runtime;

  @JsonKey(name: "spoken_languages")
  @HiveField(19)
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  @HiveField(20)
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(21)
  String? tagline;

  @JsonKey(name: "title")
  @HiveField(22)
  String? title;

  @JsonKey(name: "video")
  @HiveField(23)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(24)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(25)
  int? voteCount;

  @HiveField(26)
  bool? isNowPlaying;

  @HiveField(27)
  bool? isPopular;

  @HiveField(28)
  bool? isTopRated;

  MovieVO(
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genreIds,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.isNowPlaying,
      this.isPopular,
      this.isTopRated);
  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
