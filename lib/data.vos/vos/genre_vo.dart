import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
part 'genre_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_GenreVO,adapterName: "GenreVOAdapter")
class GenreVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int id;
  @JsonKey(name: "name")
  @HiveField(1)
  String name;

  GenreVO(this.id, this.name);

  factory GenreVO.fromJson(Map<String, dynamic> json) => _$GenreVOFromJson(json);
  Map<String, dynamic> toJson() => _$GenreVOToJson(this);
}
