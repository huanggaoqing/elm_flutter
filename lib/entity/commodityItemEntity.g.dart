// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodityItemEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityItemEntity _$CommodityItemEntityFromJson(Map<String, dynamic> json) =>
    CommodityItemEntity(
      json['name'] as String,
      json['address'] as String,
      json['id'] as int,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      (json['location'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      json['phone'] as String,
      json['category'] as String,
      (json['supports'] as List<dynamic>)
          .map((e) => SupportsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as int,
      json['recent_order_num'] as int,
      json['rating_count'] as int,
      (json['rating'] as num).toDouble(),
      json['promotion_info'] as String,
      PiecewiseAgentFeeEntity.fromJson(
          json['piecewise_agent_fee'] as Map<String, dynamic>),
      (json['opening_hours'] as List<dynamic>).map((e) => e as String).toList(),
      LicenseEntity.fromJson(json['license'] as Map<String, dynamic>),
      json['is_new'] as bool,
      json['is_premium'] as bool,
      json['image_path'] as String,
      IdentificationEntity.fromJson(
          json['identification'] as Map<String, dynamic>),
      json['float_minimum_order_amount'] as int,
      json['float_delivery_fee'] as int,
      json['distance'] as String,
      json['order_lead_time'] as String,
      json['description'] as String,
      json['delivery_mode'] == null
          ? null
          : DeliveryModeEntity.fromJson(
              json['delivery_mode'] as Map<String, dynamic>),
      json['activities'] as List<dynamic>,
      json['__v'] as int,
    );

Map<String, dynamic> _$CommodityItemEntityToJson(
        CommodityItemEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
      'phone': instance.phone,
      'category': instance.category,
      'supports': instance.supports,
      'status': instance.status,
      'recent_order_num': instance.recent_order_num,
      'rating_count': instance.rating_count,
      'rating': instance.rating,
      'promotion_info': instance.promotion_info,
      'piecewise_agent_fee': instance.piecewise_agent_fee,
      'opening_hours': instance.opening_hours,
      'license': instance.license,
      'is_new': instance.is_new,
      'is_premium': instance.is_premium,
      'image_path': instance.image_path,
      'identification': instance.identification,
      'float_minimum_order_amount': instance.float_minimum_order_amount,
      'float_delivery_fee': instance.float_delivery_fee,
      'distance': instance.distance,
      'order_lead_time': instance.order_lead_time,
      'description': instance.description,
      'delivery_mode': instance.delivery_mode,
      'activities': instance.activities,
      'iV': instance.iV,
    };
