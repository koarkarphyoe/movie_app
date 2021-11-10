import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/vos/movie_vo.dart';
part 'get_movie_by_genre_response.g.dart';

@JsonSerializable()
class GetMovieByGenreResponse {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "results")
  List<MovieVO> results;

  GetMovieByGenreResponse(this.page, this.results);

  factory GetMovieByGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMovieByGenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetMovieByGenreResponseToJson(this);
}
