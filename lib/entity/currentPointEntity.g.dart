// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentPointEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPointEntity _$CurrentPointEntityFromJson(Map<String, dynamic> json) =>
    CurrentPointEntity(
      address: json['address'] as String,
      city: json['city'] as String,
      geohash: json['geohash'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CurrentPointEntityToJson(CurrentPointEntity instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'geohash': instance.geohash,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
    };
