import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
part 'collection_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_CollectionVO,adapterName:"CollectionVOAdapter")
class CollectionVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int id;
  
  @JsonKey(name: "name")
  @HiveField(1)
  String name;

  @JsonKey(name: "poster_path")
  @HiveField(2)
  String? posterPath;

  @JsonKey(name: "backdrop_path")
  @HiveField(3)
  String? backdropPath;

  CollectionVO(this.backdropPath, this.id, this.name, this.posterPath);

  factory CollectionVO.fromJson(Map<String, dynamic> json) =>
      _$CollectionVOFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionVOToJson(this);
}
