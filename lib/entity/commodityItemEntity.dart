// ignore_for_file: file_names, prefer_void_to_null, non_constant_identifier_names

import 'package:flutterapp/entity/PiecewiseAgentFeeEntity.dart';
import 'package:flutterapp/entity/SupportsEntity.dart';
import 'package:flutterapp/entity/deliveryModeEntiy.dart';
import 'package:flutterapp/entity/identificationEntity.dart';
import 'package:flutterapp/entity/licenseEntity.dart';
import "package:json_annotation/json_annotation.dart";
part "commodityItemEntity.g.dart";

class CommodityListEntity {
  List<CommodityItemEntity> list;
  CommodityListEntity(this.list);
  factory CommodityListEntity.fromJson(List<dynamic> list) => CommodityListEntity(
    list.map((item) => CommodityItemEntity.fromJson(item as Map<String, dynamic>)).toList()
  );
}


@JsonSerializable()
class CommodityItemEntity {
  String name;
  String address;
  int id;
  double latitude;
  double longitude;
  List<double> location;
  String phone;
  String category;
  List<SupportsEntity> supports;
  int status;
  int recent_order_num;
  int rating_count;
  double rating;
  String promotion_info;
  PiecewiseAgentFeeEntity piecewise_agent_fee;
  List<String> opening_hours;
  LicenseEntity license;
  bool is_new;
  bool is_premium;
  String image_path;
  IdentificationEntity identification;
  int float_minimum_order_amount;
  int float_delivery_fee;
  String distance;
  String order_lead_time;
  String description;
  DeliveryModeEntity? delivery_mode;
  List activities;
  int iV;
  CommodityItemEntity(
      this.name,
      this.address,
      this.id,
      this.latitude,
      this.longitude,
      this.location,
      this.phone,
      this.category,
      this.supports,
      this.status,
      this.recent_order_num,
      this.rating_count,
      this.rating,
      this.promotion_info,
      this.piecewise_agent_fee,
      this.opening_hours,
      this.license,
      this.is_new,
      this.is_premium,
      this.image_path,
      this.identification,
      this.float_minimum_order_amount,
      this.float_delivery_fee,
      this.distance,
      this.order_lead_time,
      this.description,
      this.delivery_mode,
      this.activities,
      this.iV
  );
  factory CommodityItemEntity.fromJson(Map<String, dynamic> json) => _$CommodityItemEntityFromJson(json);
  Map<String, dynamic> toJson(CommodityItemEntity interface) => _$CommodityItemEntityToJson(interface);
}