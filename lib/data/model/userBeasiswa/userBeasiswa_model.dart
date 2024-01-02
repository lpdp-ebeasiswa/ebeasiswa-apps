// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

import '../userInfoBeasiswa/userInfoBeasiswa_model.dart';


part 'userBeasiswa_model.freezed.dart';
part 'userBeasiswa_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class UserBeasiswaModel with _$UserBeasiswaModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserBeasiswaModel(
      {
      String? NamaLengkap,
      String? NamaPanggilan,
      String? TempatLahir,
      String? TglLahir,
      String? JenisKelamin,
      String? Pekerjaan,
      String? NoKTP,
      String? NoPaspor,
      String? NamaPaspor,
      String? NoHP,
      String? Telp,
      String? Email,
      String? EmailAlternatif,
      String? Website,
      String? Facebook,
      String? Twitter,
      String? Skype,
      String? NegaraDomisili,
      String? KotaDomisili,
      String? AlamatDomisili,
      String? NamaOCDomisili,
      String? AlamatOCDomisili,
      String? TelpOCDomisili,
      String? EmailOCDomisili,
      String? Photo,
      String? AlamatOCStudi,
      String? NegaraOCStudi,
      String? NamaOCStudi,
      String? TelpOCStudi,
      String? EmailOCStudi,
     
      UserInfoBeasiswaModel? infoBeasiswa
      
      }) = _UserBeasiswaModel;

  factory UserBeasiswaModel.fromJson(Map<String, dynamic> json) =>
      _$UserBeasiswaModelFromJson(json);
}
