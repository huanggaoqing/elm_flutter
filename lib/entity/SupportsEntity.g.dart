// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportsEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportsEntity _$SupportsEntityFromJson(Map<String, dynamic> json) =>
    SupportsEntity(
      json['description'] as String,
      json['icon_color'] as String,
      json['icon_name'] as String,
      json['id'] as int,
      json['name'] as String,
      json['_id'] as String,
    );

Map<String, dynamic> _$SupportsEntityToJson(SupportsEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'icon_color': instance.icon_color,
      'icon_name': instance.icon_name,
      'id': instance.id,
      'name': instance.name,
      'sId': instance.sId,
    };
