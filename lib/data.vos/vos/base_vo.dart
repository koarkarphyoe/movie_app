import 'package:json_annotation/json_annotation.dart';
part 'base_vo.g.dart';

@JsonSerializable()
class BaseVO {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "profile_path")
  String? profilePath;

  BaseVO(this.name, this.profilePath);

  factory BaseVO.fromJson(Map<String, dynamic> json) => _$BaseVOFromJson(json);
  Map<String, dynamic> toJson() => _$BaseVOToJson(this);
}
