// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      alamat: json['alamat'] as String?,
      expenditure: json['expenditure'] as int?,
      expenditure_date: json['expenditure_date'] as String?,
      expenditure_time: json['expenditure_time'] as String?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'alamat': instance.alamat,
      'expenditure': instance.expenditure,
      'expenditure_date': instance.expenditure_date,
      'expenditure_time': instance.expenditure_time,
    };
