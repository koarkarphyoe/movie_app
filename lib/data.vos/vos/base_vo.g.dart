// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseVOAdapter extends TypeAdapter<BaseVO> {
  @override
  final int typeId = 2;

  @override
  BaseVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseVO(
      fields[6] as String?,
      fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BaseVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseVO _$BaseVOFromJson(Map<String, dynamic> json) => BaseVO(
      json['name'] as String?,
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$BaseVOToJson(BaseVO instance) => <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
    };
