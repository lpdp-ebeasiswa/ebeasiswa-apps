// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';


part 'userInfoBeasiswa_model.freezed.dart';
part 'userInfoBeasiswa_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class UserInfoBeasiswaModel with _$UserInfoBeasiswaModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserInfoBeasiswaModel(
      {
      String? no_induk_lpdp,
      String? program_beasiswa,
      String? jenis_cofunding,
      String? jenjang,
      String? bidang_keilmuan_kontrak,
      String? batch_pk,
      String? BatasPencarianLOA,
      String? StatusPenerima,
      String? BatasMulaiStudi,
      String? StatusMulaiStudi,
      String? StatusBeasiswa,
      String? TglAwalPembiayaan,
      String? TglAkhirPembiayaan,
     
      
      }) = _UserInfoBeasiswaModel;

  factory UserInfoBeasiswaModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoBeasiswaModelFromJson(json);
}
