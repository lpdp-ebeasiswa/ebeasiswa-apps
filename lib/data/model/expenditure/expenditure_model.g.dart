// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenditureModel _$$_ExpenditureModelFromJson(Map<String, dynamic> json) =>
    _$_ExpenditureModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      expenditure: json['expenditure'] as int? ?? 0,
      expenditureDate: json['expenditureDate'] as String?,
      expenditureTime: json['expenditureTime'] as String?,
    );

Map<String, dynamic> _$$_ExpenditureModelToJson(_$_ExpenditureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'expenditure': instance.expenditure,
      'expenditureDate': instance.expenditureDate,
      'expenditureTime': instance.expenditureTime,
    };
