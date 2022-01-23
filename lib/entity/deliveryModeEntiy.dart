// ignore_for_file: file_names, unused_import
import "package:json_annotation/json_annotation.dart";
part 'deliveryModeEntiy.g.dart';

@JsonSerializable()
class DeliveryModeEntity {
  String color;
  int id;
  bool is_solid;
  String text;

  DeliveryModeEntity(this.color, this.id, this.is_solid, this.text);

  factory DeliveryModeEntity.fromJson(Map<String, dynamic> json) => _$DeliveryModeEntityFromJson(json);
  // Map<String, dynamic> toJson(DeliveryModeEntity interface) => _$DeliveryModeEntityToJson(interface);
}