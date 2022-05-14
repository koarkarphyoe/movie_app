import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data.vos/vos/base_vo.dart';
import 'package:movie_app/persistence/daos/hive_constants.dart';

part 'credit_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: hiveTypeId_CreditVO, adapterName: "CreditVOAdapter")
class CreditVO extends BaseVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "id")
  @HiveField(2)
  int id;

  @JsonKey(name: "known_for_department")
  @HiveField(3)
  String? knownForDepartment;

  // not need after extends from BaseVO
  // @JsonKey(name: "name")
  // String? name;

  @JsonKey(name: "original_name")
  @HiveField(4)
  String? originalName;

  @JsonKey(name: "popularity")
  @HiveField(5)
  double? popularity;

  // not need after extends from BaseVO
  // @JsonKey(name: "profile_path")
  // String? profilePath;

  @JsonKey(name: "cast_id")
  @HiveField(8)
  int? castId;

  @JsonKey(name: "character")
  @HiveField(9)
  String? character;

  @JsonKey(name: "credit_id")
  @HiveField(10)
  String? creditId;

  @JsonKey(name: "order")
  @HiveField(11)
  int? order;

  @HiveField(12)
  int? movieId;

  CreditVO(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.originalName,
      this.popularity,
      String? name,
      String? profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order,
      this.movieId)
      : super(name, profilePath);

  factory CreditVO.fromJson(Map<String, dynamic> json) =>
      _$CreditVOFromJson(json);
  Map<String, dynamic> toJson() => _$CreditVOToJson(this);

  bool isActor() {
    return knownForDepartment == KNOWN_FOR_DEPARTMENT_ACTING;
  }

  bool isCreator() {
    return knownForDepartment != KNOWN_FOR_DEPARTMENT_ACTING;
  }
}

const String KNOWN_FOR_DEPARTMENT_ACTING = "Acting";
