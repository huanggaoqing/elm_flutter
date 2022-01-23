// {name: 南关一铺村, address: 河北省邯郸市大名县 , latitude: 36.28001, longitude: 115.15371, geohash: 36.28001,115.15371}
// ignore_for_file: unused_import, file_names

import 'package:flutterapp/entity/cityEntity.dart';
import "package:json_annotation/json_annotation.dart";
part "cityDetailEntity.g.dart";

class CityDetailListEntity {
  List<CityDetailEntity> cityDetailList;
  CityDetailListEntity(this.cityDetailList);
  factory CityDetailListEntity.fromJson(List<dynamic> list) =>
      CityDetailListEntity(list
          .map((detailItem) => CityDetailEntity.fromJson(detailItem))
          .toList());
}

@JsonSerializable()
class CityDetailEntity {
  String name;
  String address;
  double latitude;
  double longitude;
  String geohash;
  CityDetailEntity({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.geohash,
  });
  factory CityDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$CityDetailEntityFromJson(json);

  Map<String, dynamic> toJson(CityDetailEntity interface) =>
      _$CityDetailEntityToJson(interface);
}
