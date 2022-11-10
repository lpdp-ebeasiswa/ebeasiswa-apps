import 'dart:io';

import 'package:ebeasiswa/app/constant/baseurl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../app/helper/api_client/api_client_helper.dart';
import '../../model/expenditure/expenditure_model.dart';
part '_expenditure_datasource.dart';

class ExpenditureServices {
  final ExpenditureDataSource expenditureDataSource = ExpenditureDataSource();

  Future expenditureListServices() async {
    try {
      final response = await expenditureDataSource.loadListExpenditureUser();
      debugPrint('clog $response');
      debugPrint('clog ${response['data']}');
      final validationResponse = response['data'];
      if (validationResponse == []) {
        debugPrint('clog ${response['data']}');
        Get.snackbar('Notification', 'Data is empty');
      } else {
        final List parsedResponse = response['data'] ?? [];
        final data =
            parsedResponse.map((e) => ExpenditureModel.fromJson(e)).toList();
        return data;
      }
    } on SocketException {
      Get.snackbar('Notification', 'Cant load services');
    }
    Get.snackbar('Notification', 'Cant load data');
    return [];
  }
}
