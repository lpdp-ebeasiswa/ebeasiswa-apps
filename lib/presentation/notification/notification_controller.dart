import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebeasiswa/data/model/notification/notification_model.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/remote/push_notifikasi/push_notifikasi_service.dart';

class NotificationController extends GetxController {
  int pageIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final boxstorage = BoxStorage();
  String? username;
  final argumentData = Get.arguments;

  PushNotifikasiServices pushNotifService = PushNotifikasiServices();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  Future<void> pushNotif() async {
    String? token = boxstorage.getStorageToken();
    isLoading(true);
    try {
      pushNotifService.sendNotification(token);
      isLoading(false);
      isError(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
    return;
  }

  sendingDataNotification(String? id, String? title, String? body,
      String? username, String? icon, String? images) async {
    CollectionReference notification = firestore.collection("notification");

    try {
      await notification.doc(id).set({
        'id': id,
        'uid': boxstorage.getToken(),
        'username': username,
        'title': title,
        'body': body,
        'icon': icon,
        'images': images,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("addNotif Berhasil Add Notif");
    } on FirebaseException catch (e) {
      print('error-----> ${e.code}');
      print('error-----> ${e.message}');
    }
  }

  Stream<List<NotificationModel>> readNotification() {
    final data = firestore
        .collection("notification")
        // .where('username', isEqualTo: username)
        .snapshots()
        .map((event) => event.docs
            .map((doc) => NotificationModel.fromJson(doc.data()))
            .toList());
    return data;
  }

  Future<NotificationModel> getDataNotification(String id) {
    dynamic data = firestore.collection('notification').doc(id).get().then(
        (documentSnapshot) =>
            NotificationModel.fromJson(documentSnapshot.data()!)

        // Map<String, dynamic> data = DocumentSnapshot.data()!;
        // print('getDataSinggle --->${data.id}');

        // },
        );
    return data;
  }

  void deleteNotification(String id) async {
    DocumentReference listUsersTokenFcm =
        firestore.collection("notification").doc(id);
    try {
      await listUsersTokenFcm.delete();
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
