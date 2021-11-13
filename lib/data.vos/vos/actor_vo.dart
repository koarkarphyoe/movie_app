import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/vos/base_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';

import 'movie_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_ActorVO, adapterName: "ActorVOAdapter")
class ActorVO extends BaseVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "id")
  @HiveField(2)
  int id;

  @JsonKey(name: "known_for")
  @HiveField(3)
  List<MovieVO>? knownFor;

  @JsonKey(name: "known_for_department")
  @HiveField(4)
  String? knownForDepartment;

  // not need after extends from BaseVO
  // @JsonKey(name: "name")
  // String? name;

  @JsonKey(name: "popularity")
  @HiveField(5)
  double? popularity;

  // not need after extends from BaseVO
  // @JsonKey(name: "profile_path")
  // String? profilePath;

  // need to care when fill super properties,no need ''
  ActorVO(
      {this.adult,
      this.gender,
      required this.id,
      this.knownFor,
      this.knownForDepartment,
      this.popularity,
      String? name,
      String? profilePath})
      : super(name, profilePath);

  factory ActorVO.fromJson(Map<String, dynamic> json) =>
      _$ActorVOFromJson(json);

  Map<String, dynamic> toJson() => _$ActorVOToJson(this);
}
