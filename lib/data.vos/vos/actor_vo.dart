import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/vos/base_vo.dart';

import 'movie_vo.dart';


part 'actor_vo.g.dart';

@JsonSerializable()
class ActorVO extends BaseVO{
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "gender")
  int? gender;

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "known_for")
  List<MovieVO>? knownFor;

  @JsonKey(name: "known_for_department")
  String? knownForDepartment;

  // not need after extends from BaseVO
  // @JsonKey(name: "name")
  // String? name;

  @JsonKey(name: "popularity")
  double? popularity;

  // not need after extends from BaseVO
  // @JsonKey(name: "profile_path")
  // String? profilePath;

  // need to care when fill super properties,no need ''
  ActorVO(
      this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartment,
      this.popularity,
      String? name,
      String? profilePath) : super(name,profilePath);

  factory ActorVO.fromJson(Map<String, dynamic> json) =>
      _$ActorVOFromJson(json);
  Map<String, dynamic> toJson() => _$ActorVOToJson(this);
}
