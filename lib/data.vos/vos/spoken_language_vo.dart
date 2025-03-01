import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
part 'spoken_language_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_SpokenLanguageVO,adapterName: "SpokenLanguageVOAdapter")
class SpokenLanguageVO {
  @JsonKey(name: "english_name")
  @HiveField(0)
  String? englishName;

  @JsonKey(name: "iso_639_1")
  @HiveField(1)
  String? iso6391;

  @JsonKey(name: "name")
  @HiveField(2)
  String name;

  SpokenLanguageVO(this.englishName, this.iso6391, this.name);

  factory SpokenLanguageVO.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageVOFromJson(json);
  Map<String, dynamic> toJson() =>_$SpokenLanguageVOToJson(this);
}
