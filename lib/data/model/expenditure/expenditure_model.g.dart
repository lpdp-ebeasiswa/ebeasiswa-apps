// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_ExpenditureModel _$$_ExpenditureModelFromJson(Map<String, dynamic> json) =>
    _$_ExpenditureModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      expenditure: json['expenditure'] as int? ?? 0,
      expenditureDate: json['expenditure_date'] as String?,
      expenditureTime: json['expenditure_time'] as String?,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_ExpenditureModelToJson(_$_ExpenditureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'expenditure': instance.expenditure,
      'expenditure_date': instance.expenditureDate,
      'expenditure_time': instance.expenditureTime,
    };
