// ignore_for_file: prefer_collection_literals

import 'package:ebeasiswa/presentation/dana/dana_model.dart';
import 'package:ebeasiswa/presentation/dana/dana_services.dart';
import 'package:get/state_manager.dart';

class DanaController extends GetxController {
  var getpostdana = <PostModelDana>[].obs;

  ServicesDana servicesDana = ServicesDana();

  @override
  void onInit() {
    callpostmethod();
    print("Kepanggil Otomatis di Dana");
    super.onInit();
  }

  callpostmethod() async {
    var result = await servicesDana.getAllPosts();
    print('ini isinya apa =====> $result');
  }
}
