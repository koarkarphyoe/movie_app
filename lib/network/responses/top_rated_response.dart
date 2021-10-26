
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/movie_vo.dart';
part 'top_rated_response.g.dart';


@JsonSerializable()
class TopRatedResponse {
  @JsonKey(name: "page")
  int page;

  @JsonKey(name: "results")
  List<MovieVO> results;

  TopRatedResponse(this.page, this.results);
  factory TopRatedResponse.fromJson(Map<String, dynamic> json) =>
      _$TopRatedResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TopRatedResponseToJson(this);
}
