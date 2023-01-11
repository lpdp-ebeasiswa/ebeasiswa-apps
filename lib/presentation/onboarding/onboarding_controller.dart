import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/remote/push_notifikasi/push_notifikasi_service.dart';
import '../../main.dart';
import '../login/login_view.dart';

class OnboaringController extends GetxController {
  late PageController pageController;
  int pageIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final box = GetStorage();
  String? token;

  PushNotifikasiServices pushNotifService = PushNotifikasiServices();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    setUpNotifikasi();
    getToken();
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

  setUpNotifikasi() {
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Ketika notifikasi di klik dan keadaanya on Terminate
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        print('broadcast ${event.notification!.title}');
        // var routeName = event.data['route'];
        // Navigator.of(context).pushNamed(routeName);
      }
    });

    //Ketika notifikasi di klik dan keadaan nya on background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('broadcast ${event.notification!.title}');
      // var routeName = event.data['route'];
      // Navigator.of(context).pushNamed(routeName);
    });

    //Ketika on background
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
              ),
            ));
      }
    });
  }

  getToken() async {
    String getToken = (await FirebaseMessaging.instance.getToken())!;
    token = getToken;
    String? storageToken = box.read('fcmtoken');

    if (storageToken == null) {
      CollectionReference user = firestore.collection("user");
      try {
        await user.add({
          "fcmtoken": token,
        }).then((value) => null);
        box.write('fcmtoken', token);
        print("Berhasil simpan token");
      } catch (e) {
        print("Gagal simpan token");
      }
    } else {
      print("Token Sudah ada");
    }
  }

  Stream<QuerySnapshot<Object?>> streamDataUserTokenFCM() {
    CollectionReference user = firestore.collection("user");
    return user.snapshots();
  }

  void deleteFaq(String id) async {
    DocumentReference listUsersTokenFcm = firestore.collection("user").doc(id);
    try {
      await listUsersTokenFcm.delete();
      await box.remove('fcmtoken');
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

  Future<void> pushNotif() async {
    isLoading(true);
    try {
      pushNotifService.loadPushNotif(token!);
      isLoading(false);
      isError(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
    return;
  }
}
