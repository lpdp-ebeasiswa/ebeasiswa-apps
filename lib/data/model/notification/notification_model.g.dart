// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      icons: json['icons'] as String?,
      images: json['images'] as String?,
      createdAt: json['createdAt'] as Timestamp?,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'title': instance.title,
      'body': instance.body,
      'icons': instance.icons,
      'images': instance.images,
      'createdAt': instance.createdAt,
    };
