// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      alamat: json['alamat'] as String?,
      expenditure: json['expenditure'] as int? ?? 0,
      expenditureDate: json['expenditure_date'] as String?,
      expenditureTime: json['expenditure_time'] as String?,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'alamat': instance.alamat,
      'expenditure': instance.expenditure,
      'expenditure_date': instance.expenditureDate,
      'expenditure_time': instance.expenditureTime,
    };
