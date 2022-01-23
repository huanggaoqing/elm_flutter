// ignore_for_file: file_names

import "package:json_annotation/json_annotation.dart";
part "currentPointEntity.g.dart";

@JsonSerializable()
class CurrentPointEntity {
  String address;
  String city;
  String geohash;
  String latitude;
  String longitude;
  String name;
  CurrentPointEntity(
      {required this.address,
      required this.city,
      required this.geohash,
      required this.latitude,
      required this.longitude,
      required this.name});
  factory CurrentPointEntity.fromJson(Map<String, dynamic> json) =>
      _$CurrentPointEntityFromJson(json);
  Map<String, dynamic> toJson(CurrentPointEntity interface) =>
      _$CurrentPointEntityToJson(interface);
}
