// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unused_field

import "package:json_annotation/json_annotation.dart";
part "SupportsEntity.g.dart";

@JsonSerializable()
class SupportsEntity {
  String description;
  String icon_color;
  String icon_name;
  int id;
  String name;
  String sId;

  SupportsEntity(
      this.description,
      this.icon_color,
      this.icon_name,
      this.id,
      this.name,
      this.sId
  );

  factory SupportsEntity.fromJson(Map<String, dynamic> json) => _$SupportsEntityFromJson(json);
  // Map<String, dynamic> toJson(SupportsEntity interface) => _$SupportsEntityToJson(interface);
}
