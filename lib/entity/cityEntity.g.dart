// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cityEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => CityEntity(
      json['pinyin'] as String,
      json['is_map'] as bool,
      (json['longitude'] as num).toDouble(),
      (json['latitude'] as num).toDouble(),
      json['sort'] as int,
      json['area_code'] as String,
      json['abbr'] as String,
      json['name'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$CityEntityToJson(CityEntity instance) =>
    <String, dynamic>{
      'pinyin': instance.pinyin,
      'is_map': instance.is_map,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'sort': instance.sort,
      'area_code': instance.area_code,
      'abbr': instance.abbr,
      'name': instance.name,
      'id': instance.id,
    };
