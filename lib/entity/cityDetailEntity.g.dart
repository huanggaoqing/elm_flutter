// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cityDetailEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDetailEntity _$CityDetailEntityFromJson(Map<String, dynamic> json) =>
    CityDetailEntity(
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      geohash: json['geohash'] as String,
    );

Map<String, dynamic> _$CityDetailEntityToJson(CityDetailEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geohash': instance.geohash,
    };
