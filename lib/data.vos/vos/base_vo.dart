import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
part 'base_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_BaseVO, adapterName: "BaseVOAdapter")
class BaseVO {
  @JsonKey(name: "name")
  @HiveField(6)
  String? name;

  @JsonKey(name: "profile_path")
  @HiveField(7)
  String? profilePath;

  BaseVO(this.name,this.profilePath);

  factory BaseVO.fromJson(Map<String, dynamic> json) => _$BaseVOFromJson(json);
  Map<String, dynamic> toJson() => _$BaseVOToJson(this);
}
