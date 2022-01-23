// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryModeEntiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryModeEntity _$DeliveryModeEntityFromJson(Map<String, dynamic> json) =>
    DeliveryModeEntity(
      json['color'] as String,
      json['id'] as int,
      json['is_solid'] as bool,
      json['text'] as String,
    );

Map<String, dynamic> _$DeliveryModeEntityToJson(DeliveryModeEntity instance) =>
    <String, dynamic>{
      'color': instance.color,
      'id': instance.id,
      'is_solid': instance.is_solid,
      'text': instance.text,
    };
