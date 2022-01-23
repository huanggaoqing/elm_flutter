// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new
import "package:json_annotation/json_annotation.dart";
part 'groupSwiperEntity.g.dart';

class GroupSwiperListEntity {
  List<GroupSwiperEntity> list = [];
  GroupSwiperListEntity({required this.list});
  factory GroupSwiperListEntity.fromJson(List<dynamic> data) =>
      new GroupSwiperListEntity(
        list: data.map((item) => GroupSwiperEntity.fromJson(item)).toList(),
      );
}

@JsonSerializable()
class GroupSwiperEntity {
  String description;
  String icon_url;
  int id;
  String image_url;
  bool is_in_serving;
  String link;
  String title;
  String title_color;

  GroupSwiperEntity({
    required this.description,
    required this.icon_url,
    required this.id,
    required this.image_url,
    required this.is_in_serving,
    required this.link,
    required this.title,
    required this.title_color,
  });

  factory GroupSwiperEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupSwiperEntityFromJson(json);
  Map<String, dynamic> toJson(GroupSwiperEntity interface) =>
      _$GroupSwiperEntityToJson(interface);
}
