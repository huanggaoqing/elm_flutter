// ignore_for_file: file_names, non_constant_identifier_names

import "package:json_annotation/json_annotation.dart";
part 'licenseEntity.g.dart';

@JsonSerializable()
class LicenseEntity {
  String catering_service_license_image;
  String business_license_image;
  LicenseEntity(this.catering_service_license_image, this.business_license_image);
  factory LicenseEntity.fromJson(Map<String, dynamic> json) => _$LicenseEntityFromJson(json);
  // Map<String, dynamic> toJson(LicenseEntity interface) => _$LicenseEntityToJson(interface);
}