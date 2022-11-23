import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var msgErr = ''.obs;
  var msgErrValidator = ''.obs;
  var typeValidator = ''.obs;
  RegExp? source;

  var emailCtrl = TextEditingController().obs;
  var tempatLahirCtrl = TextEditingController().obs;
  var phoneCtrl = TextEditingController().obs;
  var passwordCtrl = TextEditingController().obs;
  var fullnameCtrl = TextEditingController().obs;
  var nicknameCtrl = TextEditingController().obs;
  var nikCtrl = TextEditingController().obs;
  var kkCtrl = TextEditingController().obs;
  var dateOfBirthCtrl = TextEditingController().obs;
  var photoCtrl = TextEditingController().obs;

  @override
  void onClose() {
    super.onClose();
    emailCtrl.close();
    tempatLahirCtrl.close();
    phoneCtrl.close();
    passwordCtrl.close();
    fullnameCtrl.close();
    nicknameCtrl.close();
    nikCtrl.close();
    kkCtrl.close();
    dateOfBirthCtrl.close();
    photoCtrl.close();
  }

  checkValidator(String? text, TypeValidator type) {
    switch (type) {
      case TypeValidator.password:
        source = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
        msgErr.value = "Kata sandi tidak boleh kosong";
        msgErrValidator.value =
            "Kata sandi harus mempunyai 1 huruf besar dan kecil \nminimal 8 huruf dan 1 spesial karakter! ";
        break;
      case TypeValidator.email:
        source = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
        msgErr.value = "Email tidak boleh kosong";
        msgErrValidator.value = "Format email tidak valid ";
        break;
      case TypeValidator.fullname:
        source = RegExp(r'^\s*[A-Za-z]{3}[^\n\d?=.*?[!@#\"%^()-_+{}|/<$&*~]*$');
        msgErr.value = "Nama lengkap tidak boleh kosong";
        msgErrValidator.value =
            "Nama lengkap minimal 3 huruf dan tidak boleh ada karakter ";
        break;
      case TypeValidator.nickname:
        source = RegExp(r'^\s*[A-Za-z]{3}[^\n\d?=.*?[!@#\"%^()-_+{}|/<$&*~]*$');
        msgErr.value = "Nama panggilan tidak boleh kosong";
        msgErrValidator.value =
            "Nama panggilan minimal 3 huruf dan tidak boleh ada karakter";
        break;
      case TypeValidator.nik:
        source = RegExp(
            r'^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$');
        msgErr.value = "NIK tidak boleh kosong";
        msgErrValidator.value = "NIK tidak Valid ";
        break;
      case TypeValidator.kk:
        source = RegExp(
            r'^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$');
        msgErr.value = "KK tidak boleh kosong";
        msgErrValidator.value = "KK tidak Valid ";
        break;
      case TypeValidator.place:
        source = RegExp(r'^\s*[A-Za-z]{3}[^\n\d?=.*?[!@#\"%^()-_+{}|/<$&*~]*$');
        msgErr.value = "Alamat tidak boleh kosong";
        msgErrValidator.value =
            "Alamat minimal 3 huruf dan tidak boleh ada karakter ";
        break;
      case TypeValidator.phone:
        source = RegExp(
            r'^(\+62|62)?[\s-]?0?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$');
        msgErr.value = "Nomor HP tidak boleh kosong";
        msgErrValidator.value = "Nomor hp tidak valid ";
        break;
      case TypeValidator.dateOfBirth:
        source = RegExp(
            r'^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})$');
        msgErr.value = "Tanggal lahir tidak boleh kosong";
        msgErrValidator.value = "Tanggal lahir tidak valid ";
        break;
      case TypeValidator.photo:
        source = RegExp(r'^.*\.(png|PNG|mime|MIME)$');
        msgErr.value = "Photo tidak boleh kosong";
        msgErrValidator.value =
            "Ukuran gambar harus kurang dari 1 MB \ndan format gambar harus .png atau .mime";
        break;
    }

    if (text == null || text.isEmpty) {
      return msgErr.value;
    }
    if (!source!.hasMatch(text)) {
      return msgErrValidator.value;
    }
    return null;
  }
}

enum TypeValidator {
  email,
  password,
  fullname,
  nickname,
  kk,
  phone,
  place,
  nik,
  dateOfBirth,
  photo
}
