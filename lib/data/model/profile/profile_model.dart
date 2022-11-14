// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required int id,
    required String name,
    String? email,
    String? alamat,
    @Default(0) int? expenditure,
    String? expenditureDate,
    String? expenditureTime,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
