import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebeasiswa/data/model/users/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/remote/push_notifikasi/push_notifikasi_service.dart';
import '../login/login_view.dart';

class OnboaringController extends GetxController {
  late PageController pageController;
  int pageIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final boxstorage = BoxStorage();

  PushNotifikasiServices pushNotifService = PushNotifikasiServices();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  nextPage() {
    pageIndex != 2
        ? pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease)
        : Get.to(const LoginView());
  }

  Stream<List<UsersModel>> readUsers() {
    final data = firestore.collection("user").snapshots().map((event) =>
        event.docs.map((doc) => UsersModel.fromJson(doc.data())).toList());
    return data;
  }

  void deleteUsers(String id) async {
    DocumentReference listUsersTokenFcm = firestore.collection("user").doc(id);
    try {
      await listUsersTokenFcm.delete();
      boxstorage.deleteStorageToken();
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal dihapus",
        textConfirm: "Ok",
        onCustom: () {
          Get.back();
        },
      );
    }
  }
}
