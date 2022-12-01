import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifikasiEmailController extends GetxController {
  dynamic argumentData = Get.arguments;

  var msgErr = ''.obs;
  var msgErrValidator = ''.obs;
  var typeValidator = ''.obs;
  RegExp? source;

  var emailCtrl = TextEditingController().obs;
  var kodeUnikCtrl_1 = TextEditingController().obs;
  var kodeUnikCtrl_2 = TextEditingController().obs;
  var kodeUnikCtrl_3 = TextEditingController().obs;
  var kodeUnikCtrl_4 = TextEditingController().obs;
  String? kodeOTP;
  var sukses = false.obs;

  @override
  void onClose() {
    super.onClose();
    emailCtrl.close();
  }

  @override
  void onInit() {
    debugPrint('data email ${argumentData[0]['email']}');
    debugPrint('data verifikasi ${argumentData[1]['verifikasi']}');
    super.onInit();
  }

  void verifyOTP() {
    kodeOTP = kodeUnikCtrl_1.value.text +
        kodeUnikCtrl_2.value.text +
        kodeUnikCtrl_3.value.text +
        kodeUnikCtrl_4.value.text;

    // var res = EmailAuth(sessionName: "Test Session").validateOtp(
    //     recipientMail: argumentData[0]['email'], userOtp: kodeOTP ?? '');

    // if (res) {
    //   sukses.value = res;
    //   debugPrint("sukses------> ${sukses.value}");
    //   Get.snackbar('Berhasil verifikasi', 'Email anda telah diverifikasi');
    // } else {
    //   sukses.value = res;
    //   debugPrint("sukses------> ${sukses.value}");
    //   Get.snackbar('Gagak verifikasi', 'OTP yang di kirim tidak sama');
    // }
  }

  checkValidator(String? text, TypeValidator type) {
    switch (type) {
      case TypeValidator.email:
        source = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
        msgErr.value = "Email tidak boleh kosong";
        msgErrValidator.value = "Format email tidak valid ";
        break;
      case TypeValidator.kodeUnik:
        source = RegExp(r'^[0-9]');
        msgErr.value = "Harus di isi";
        msgErrValidator.value = "Kode unik tidak valid ";
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
  kodeUnik,
}
