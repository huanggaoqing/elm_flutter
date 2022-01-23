// ignore_for_file: prefer_collection_literals, prefer_void_to_null, file_names, unused_import, non_constant_identifier_names
import "package:json_annotation/json_annotation.dart";
part "identificationEntity.g.dart";

@JsonSerializable()
class IdentificationEntity {
  String registered_number;
  String registered_address;
  String operation_period;
  String licenses_scope;
  String licenses_number;
  String licenses_date;
  String legal_person;
  // Null identificate_date;
  String identificate_agency;
  String company_name;

  IdentificationEntity(
    this.registered_number,
    this.registered_address,
    this.operation_period,
    this.licenses_scope,
    this.licenses_number,
    this.licenses_date,
    this.legal_person,
    // this.identificate_date,
    this.identificate_agency,
    this.company_name
  );

  factory IdentificationEntity.fromJson(Map<String, dynamic> json) => _$IdentificationEntityFromJson(json);
  // Map<String, dynamic> toJson(IdentificationEntity interface) => _$IdentificationEntityToJson(interface);
}