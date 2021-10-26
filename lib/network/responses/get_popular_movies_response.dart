import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
import 'package:movie_app/data.vos/vos/results_vo.dart';
part 'get_popular_movies_response.g.dart';

@JsonSerializable()
class GetPopularMoviesResponse {
  @JsonKey(name: "page")
  late int page;

  @JsonKey(name: "results")
  late List<ResultsVO> results;
  GetPopularMoviesResponse(this.page, this.results);

  factory GetPopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPopularMoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPopularMoviesResponseToJson(this);
}
