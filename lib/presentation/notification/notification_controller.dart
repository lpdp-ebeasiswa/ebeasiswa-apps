import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebeasiswa/data/db_local/db_notification.dart';
import 'package:ebeasiswa/data/model/notification/notification_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/remote/push_notifikasi/push_notifikasi_service.dart';

class NotificationController extends GetxController {
  int pageIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final boxstorage = BoxStorage();
  String? username;
  bool? readNotif;
  final argumentData = Get.arguments;

  PushNotifikasiServices pushNotifService = PushNotifikasiServices();
  DbLocalNotification dbLocalNotif = DbLocalNotification();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  int? unReadNotif;
  String? time;

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

//untuk create notifkasi ke firesotre dan ke local
  sendingDataNotification(String? idNotif, String? title, String? body,
      String? username, bool? read, String? icon, String? images) async {
    CollectionReference notification = firestore.collection("notification");
    DateTime now = DateTime.now();
    String? formattedDate = DateFormat().format(now);

//data params firestore
    Map<String, dynamic> dataFirestore = {
      'id': idNotif,
      'uid': boxstorage.getToken(),
      'username': username,
      'title': title,
      'body': body,
      'icon': icon,
      'images': images ?? '',
      'read': read,
      'createdAt': FieldValue.serverTimestamp(),
    };

//data params database local
    Map<String, dynamic> dataLocal = {
      'firestoreId': idNotif,
      'uid': boxstorage.getToken(),
      'username': username,
      'title': title,
      'body': body,
      'icons': icon,
      'images': images ?? '',
      'createdAt': formattedDate
    };

    try {
      await notification.doc(idNotif.toString()).set(dataFirestore);
      await dbLocalNotif.insert(dataLocal);
      print("cekk addNotif Berhasil Add Notif");
    } on FirebaseException catch (e) {
      print('error-----> ${e.code}');
      print('error-----> ${e.message}');
    }
  }

//untuk menampilkan list data notifikasi
  Stream<List<NotificationModel>> readNotification() {
    final data = firestore
        .collection("notification")
        .where('username', isEqualTo: username)
        .snapshots()
        .map((event) => event.docs
            .map((doc) => NotificationModel.fromJson(doc.data()))
            .toList());
    return data;
  }

//untuk menampilkan berapa jumlah data notifikasi yang belum di baca
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>> cekUnreadNotif() {
    return firestore
        .collection("notification")
        .where('username', isEqualTo: username)
        .where('read', isEqualTo: false)
        .snapshots()
        .listen((event) {
      unReadNotif = event.docs.length;
      boxstorage.setCountNotif(unReadNotif!);
    });
  }

//untuk menampilkan detail notifikasi
  Future<NotificationModel> getDataNotification(String id) {
    dynamic data = firestore.collection('notification').doc(id).get().then(
        (documentSnapshot) =>
            NotificationModel.fromJson(documentSnapshot.data()!));
    return data;
  }

//untuk mengupdate data jika notifiaki sudah di baca
  Future<void> notifRead(String id) {
    DocumentReference listUpdateNotif =
        firestore.collection("notification").doc(id);
    return listUpdateNotif
        .update({'read': true})
        .then((value) => print("Notif Updated Read"))
        .catchError((error) => print("Failed to update Notif: $error"));
  }

//untuk mendelete notifikasi
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
