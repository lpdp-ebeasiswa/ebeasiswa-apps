// ignore_for_file: prefer_collection_literals

import 'package:ebeasiswa/presentation/dana/dana_model.dart';
import 'package:ebeasiswa/presentation/dana/dana_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class DanaController extends GetxController {
  var getpostdana = <PostModelDana>[].obs;

  ServicesDana servicesDana = ServicesDana();

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    var result = await servicesDana.getAllPosts();
    debugPrint('result ini isinya apa =====> $result');
  }
}
