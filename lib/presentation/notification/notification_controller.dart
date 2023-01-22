import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebeasiswa/data/model/notification/notification_model.dart';
import 'package:ebeasiswa/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/remote/push_notifikasi/push_notifikasi_service.dart';

class NotificationController extends GetxController {
  int pageIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final boxstorage = BoxStorage();
  String? username;

  @override
  void onInit() {
    setUpNotifikasi();
    super.onInit();
  }

  PushNotifikasiServices pushNotifService = PushNotifikasiServices();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  setUpNotifikasi() {
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Ketika notifikasi di klik dan keadaanya on Terminate
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      RemoteNotification? notification = message?.notification;
      AndroidNotification? android = message?.notification?.android;
      if (notification != null && android != null) {
        var routeName = message?.data['route'];
        var image = message?.data['url'];
        int id = notification.hashCode;
        String? title = notification.title ?? '';
        String? body = notification.body ?? '';
        String? info = "TERMINATE";
        // Get.toNamed(routeName);
        sendingDataNotification(title, body);
        showNotifLocal(info, id, title, body, image, routeName);
        //   showNotifLocal(info, id, title!, body!, image, routeName);
      }
    });

    //Ketika notifikasi di klik dan keadaan nya on background
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     var routeName = message.data['route'];
    //     var image = message.data['url'];
    //     int id = notification.hashCode;
    //     String? title = notification.title!;
    //     String? body = notification.body!;
    //     String? info = "BACKGROUND";
    //     // Get.toNamed(routeName!);
    //     sendingDataNotification(title, body);
    //     // print('routeName---> $routeName');
    //     showNotifLocal(info, id, title, body, image, routeName);
    //   }
    // });
    // FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     var routeName = message.data['route'];
    //     var image = message.data['url'];
    //     int id = notification.hashCode;
    //     String? title = notification.title!;
    //     String? body = notification.body!;
    //     String? info = "BACKGROUND";
    //     // Get.toNamed(routeName!);
    //     await sendingDataNotification(title, body);
    //     // print('routeName---> $routeName');
    //     await showNotifLocal(info, id, title, body, image, routeName);
    //   }
    // });

    //Ketika on foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        String? routeName = message.data['route'] ?? '';
        String? image = message.data['url'] ?? '';
        int id = notification.hashCode;
        String? title = notification.title!;
        String? body = notification.body!;
        String? info = "FOREGROUND";
        // if (routeName != null) {
        //   Get.toNamed(routeName);
        // }
        sendingDataNotification(title, body);
        showNotifLocal(info, id, title, body, image!, routeName!);
      }
    });
  }

  Future<void> pushNotif() async {
    String? token = boxstorage.getStorageToken();
    isLoading(true);
    try {
      pushNotifService.loadPushNotif(token);
      // showNotifLocal();
      isLoading(false);
      isError(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
    return;
  }

  sendingDataNotification(String title, String body) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference notification = firestore.collection("notification");
    DocumentReference docReference = notification.doc();
    try {
      await notification.doc(docReference.id).set({
        'id': docReference.id,
        'uid': boxstorage.getToken(),
        'username': username,
        'title': title,
        'body': body,
        'createdAt': DateTime.now(),
      });
      print("Berhasil Add Notif");
    } catch (e) {
      print(e);
    }
  }

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
