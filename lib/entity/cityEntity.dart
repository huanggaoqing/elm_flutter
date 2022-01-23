// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, unused_import, unnecessary_new, file_names

import "package:json_annotation/json_annotation.dart";
part 'cityEntity.g.dart';

class CityMapEntity {

  Map<String, List<CityEntity>> cityMap;

  CityMapEntity(this.cityMap);

  factory CityMapEntity.fromJson(Map<String, dynamic> json) {
    Map<String, List<CityEntity>> c = {};
    json.forEach((key, value) {
        c[key] = (value as List<dynamic>).map((item) => CityEntity.fromJson(item)).toList();
    });
    return new CityMapEntity(c);
  }

}

class CityListEntity {

  List<CityEntity> cityList;

  CityListEntity(this.cityList);

  factory CityListEntity.fromJson(List<dynamic> list) => new CityListEntity(
    list.map((cityItem) => CityEntity.fromJson(cityItem)).toList(),
  );

}

@JsonSerializable()
class CityEntity {

  CityEntity(
    this.pinyin,
    this.is_map,
    this.longitude,
    this.latitude,
    this.sort,
    this.area_code,
    this.abbr,
    this.name,
    this.id,
  );

  String pinyin;
  bool is_map;
  double longitude;
  double latitude;
  int sort;
  String area_code;
  String abbr;
  String name;
  int id;

  factory CityEntity.fromJson(Map<String, dynamic> json) => _$CityEntityFromJson(json);

  Map<String, dynamic> toJson(CityEntity interface) => _$CityEntityToJson(interface);

}
