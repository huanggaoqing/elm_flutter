// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'licenseEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicenseEntity _$LicenseEntityFromJson(Map<String, dynamic> json) =>
    LicenseEntity(
      json['catering_service_license_image'] as String,
      json['business_license_image'] as String,
    );

Map<String, dynamic> _$LicenseEntityToJson(LicenseEntity instance) =>
    <String, dynamic>{
      'catering_service_license_image': instance.catering_service_license_image,
      'business_license_image': instance.business_license_image,
    };
