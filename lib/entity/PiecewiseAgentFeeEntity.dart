// ignore_for_file: file_names

import "package:json_annotation/json_annotation.dart";
part "PiecewiseAgentFeeEntity.g.dart";
@JsonSerializable()
class PiecewiseAgentFeeEntity {
  String tips;
  PiecewiseAgentFeeEntity(this.tips);
  factory PiecewiseAgentFeeEntity.fromJson(Map<String, dynamic> json) => _$PiecewiseAgentFeeEntityFromJson(json);
  // Map<String, dynamic> toJson(PiecewiseAgentFeeEntity interface) => _$PiecewiseAgentFeeEntityToJson(interface);
}