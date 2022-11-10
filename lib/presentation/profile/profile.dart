// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile(
      {required int? id,
      String? name,
      String? email,
      String? alamat,
      int? expenditure,
      String? expenditure_date,
      String? expenditure_time}) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}
