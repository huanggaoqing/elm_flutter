// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identificationEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentificationEntity _$IdentificationEntityFromJson(
        Map<String, dynamic> json) =>
    IdentificationEntity(
      json['registered_number'] as String,
      json['registered_address'] as String,
      json['operation_period'] as String,
      json['licenses_scope'] as String,
      json['licenses_number'] as String,
      json['licenses_date'] as String,
      json['legal_person'] as String,
      json['identificate_agency'] as String,
      json['company_name'] as String,
    );

Map<String, dynamic> _$IdentificationEntityToJson(
        IdentificationEntity instance) =>
    <String, dynamic>{
      'registered_number': instance.registered_number,
      'registered_address': instance.registered_address,
      'operation_period': instance.operation_period,
      'licenses_scope': instance.licenses_scope,
      'licenses_number': instance.licenses_number,
      'licenses_date': instance.licenses_date,
      'legal_person': instance.legal_person,
      'identificate_agency': instance.identificate_agency,
      'company_name': instance.company_name,
    };
