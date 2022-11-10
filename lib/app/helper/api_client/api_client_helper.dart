import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constant/baseurl.dart';

part '_payload_data.dart';

class ApiClient {

  final PayloadData payloadData = PayloadData();
  String baseUrl = MasterUri.baseurl.baseMock;

  // ignore: unused_local_variable
  final headers = {
    "X-RapidAPI-Key": "",
    "X-RapidAPI-Host": "",
    "Bearer": "",
    "X-CSRF-Token": "",
  };

  Future<Map?> getList(String pathUrl) async {
    try {
      final fullUrl = "$baseUrl/$pathUrl";
      debugPrint('clog full url : $fullUrl');

      final response = await http.Client()
          .get(Uri.parse(fullUrl))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw Get.snackbar(
            "Request Timeout", "Connection time out, please try again");
      });
      return payloadData.catchPayloadData(response);
    } finally {
      http.Client().close();
    }
  }
}
