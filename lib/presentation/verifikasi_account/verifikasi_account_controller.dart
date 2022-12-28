import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class VerifikasiAccountController extends GetxController {
  var phoneCtrl = TextEditingController().obs;
  var otpCtrl = TextEditingController().obs;
  var messageOtpCode = ''.obs;
  var counter = 0.obs;
  String? codeAppSignature;
  String? otpCode;
  late TwilioFlutter twilioFlutter;

  @override
  void onInit() async {
    super.onInit();
    configTwilio();
    getAppSignaure();
  }

  Future getAppSignaure() async {
    codeAppSignature = await SmsAutoFill().getAppSignature;
    debugPrint("code AppSignature == $codeAppSignature");
    listenForCode();
  }

  configTwilio() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC7d81f6daf5d527efac07b622bc699d40',
        authToken: '0dc8bb813b8de761e46bc71ad7b126b7',
        twilioNumber: '+19852608587');
  }

  sendSms(String? appSignature, String? phone) {
    getAppSignaure();
    Random random = Random();
    int codeRandmom = random.nextInt(1000) + 1000;
    otpCode = codeRandmom.toString();
    twilioFlutter.sendSMS(
        toNumber: phone!, messageBody: '<#> kode anda $otpCode $appSignature');
    print("code appSignature $appSignature Code OTP $otpCode");
  }

  Future listenForCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void onClose() {
    super.onClose();
    phoneCtrl.close();
    otpCtrl.close();
    SmsAutoFill().unregisterListener();
  }

  validasiNomorTelepon(String? text) {
    RegExp? source;
    source = RegExp(r'^(\+62)?[\s-]?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$');
    if (text == null || text.isEmpty) {
      return "Nomor hp tidak boleh kosong";
    }
    if (!source.hasMatch(text)) {
      return "Nomor hp tidak sesuai, pastikan di awali dengan +62";
    }
  }
}
