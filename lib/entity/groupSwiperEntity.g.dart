// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupSwiperEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupSwiperEntity _$GroupSwiperEntityFromJson(Map<String, dynamic> json) =>
    GroupSwiperEntity(
      description: json['description'] as String,
      icon_url: json['icon_url'] as String,
      id: json['id'] as int,
      image_url: json['image_url'] as String,
      is_in_serving: json['is_in_serving'] as bool,
      link: json['link'] as String,
      title: json['title'] as String,
      title_color: json['title_color'] as String,
    );

Map<String, dynamic> _$GroupSwiperEntityToJson(GroupSwiperEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'icon_url': instance.icon_url,
      'id': instance.id,
      'image_url': instance.image_url,
      'is_in_serving': instance.is_in_serving,
      'link': instance.link,
      'title': instance.title,
      'title_color': instance.title_color,
    };
