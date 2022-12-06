import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var titleC = TextEditingController().obs;
  var descC = TextEditingController().obs;
  var categoryIdC = TextEditingController().obs;

  void addFaq(String title, String desc, String categoryId) async {
    CollectionReference faq = firestore.collection("faq");
    try {
      await faq.add({
        "title": title,
        "desc": desc,
        "categoryId": categoryId,
        "createAt": DateTime.now(),
      }).then((value) => null);

      Get.defaultDialog(
        title: "berhasil",
        middleText: "Berhasil menambahkan faq",
        textConfirm: "Ok",
        onConfirm: () {
          titleC.value.clear();
          descC.value.clear();
          categoryIdC.value.clear();
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menambahkan faq!",
        textConfirm: "Ok",
        onCustom: () {
          Get.back();
        },
      );
    }
  }

  Stream<QuerySnapshot<Object?>> streamDataFaq() {
    CollectionReference faq = firestore.collection("faq");
    return faq.snapshots();
  }

  void deleteFaq(String id) async {
    DocumentReference listFaq = firestore.collection("faq").doc(id);
    try {
      await listFaq.delete();
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

  @override
  void onClose() {
    titleC.close();
    descC.close();
    categoryIdC.close();
    super.onClose();
  }
}
