import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUltils extends GetxController {
  
  ebeasiswaSnackbar({
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        backgroundColor: Colors.green);
  }
}
