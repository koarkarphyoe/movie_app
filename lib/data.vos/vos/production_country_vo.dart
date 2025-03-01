import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';
part 'production_country_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_ProductionCountryVO,adapterName: "ProductionCountryVOAdapter")
class ProductionCountryVO {
  @JsonKey(name: "iso_3166_1")
  @HiveField(0)
  String? iso31661;

  @JsonKey(name: "name")
  @HiveField(1)
  String name;

  ProductionCountryVO(this.iso31661, this.name);

  factory ProductionCountryVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryVOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryVOToJson(this);


}
