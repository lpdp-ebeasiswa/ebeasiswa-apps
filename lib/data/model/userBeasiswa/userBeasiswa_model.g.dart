// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userBeasiswa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserBeasiswaModel _$$_UserBeasiswaModelFromJson(Map<String, dynamic> json) =>
    _$_UserBeasiswaModel(
      NamaLengkap: json['nama_lengkap'] as String?,
      NamaPanggilan: json['nama_panggilan'] as String?,
      TempatLahir: json['tempat_lahir'] as String?,
      TglLahir: json['tgl_lahir'] as String?,
      JenisKelamin: json['jenis_kelamin'] as String?,
      Pekerjaan: json['pekerjaan'] as String?,
      NoKTP: json['no_k_t_p'] as String?,
      NoPaspor: json['no_paspor'] as String?,
      NamaPaspor: json['nama_paspor'] as String?,
      NoHP: json['no_h_p'] as String?,
      Telp: json['telp'] as String?,
      Email: json['email'] as String?,
      EmailAlternatif: json['email_alternatif'] as String?,
      Website: json['website'] as String?,
      Facebook: json['facebook'] as String?,
      Twitter: json['twitter'] as String?,
      Skype: json['skype'] as String?,
      NegaraDomisili: json['negara_domisili'] as String?,
      KotaDomisili: json['kota_domisili'] as String?,
      AlamatDomisili: json['alamat_domisili'] as String?,
      NamaOCDomisili: json['nama_o_c_domisili'] as String?,
      AlamatOCDomisili: json['alamat_o_c_domisili'] as String?,
      TelpOCDomisili: json['telp_o_c_domisili'] as String?,
      EmailOCDomisili: json['email_o_c_domisili'] as String?,
      Photo: json['photo'] as String?,
      AlamatOCStudi: json['alamat_o_c_studi'] as String?,
      NegaraOCStudi: json['negara_o_c_studi'] as String?,
      NamaOCStudi: json['nama_o_c_studi'] as String?,
      TelpOCStudi: json['telp_o_c_studi'] as String?,
      EmailOCStudi: json['email_o_c_studi'] as String?,
      infoBeasiswa: json['info_beasiswa'] == null
          ? null
          : UserInfoBeasiswaModel.fromJson(
              json['info_beasiswa'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserBeasiswaModelToJson(
        _$_UserBeasiswaModel instance) =>
    <String, dynamic>{
      'nama_lengkap': instance.NamaLengkap,
      'nama_panggilan': instance.NamaPanggilan,
      'tempat_lahir': instance.TempatLahir,
      'tgl_lahir': instance.TglLahir,
      'jenis_kelamin': instance.JenisKelamin,
      'pekerjaan': instance.Pekerjaan,
      'no_k_t_p': instance.NoKTP,
      'no_paspor': instance.NoPaspor,
      'nama_paspor': instance.NamaPaspor,
      'no_h_p': instance.NoHP,
      'telp': instance.Telp,
      'email': instance.Email,
      'email_alternatif': instance.EmailAlternatif,
      'website': instance.Website,
      'facebook': instance.Facebook,
      'twitter': instance.Twitter,
      'skype': instance.Skype,
      'negara_domisili': instance.NegaraDomisili,
      'kota_domisili': instance.KotaDomisili,
      'alamat_domisili': instance.AlamatDomisili,
      'nama_o_c_domisili': instance.NamaOCDomisili,
      'alamat_o_c_domisili': instance.AlamatOCDomisili,
      'telp_o_c_domisili': instance.TelpOCDomisili,
      'email_o_c_domisili': instance.EmailOCDomisili,
      'photo': instance.Photo,
      'alamat_o_c_studi': instance.AlamatOCStudi,
      'negara_o_c_studi': instance.NegaraOCStudi,
      'nama_o_c_studi': instance.NamaOCStudi,
      'telp_o_c_studi': instance.TelpOCStudi,
      'email_o_c_studi': instance.EmailOCStudi,
      'info_beasiswa': instance.infoBeasiswa,
    };
