import 'package:catcher/catcher.dart';
import 'package:ebeasiswa/app/routes/route_name.dart';
import 'package:ebeasiswa/ebeasiswa_app.dart';
import 'package:ebeasiswa/presentation/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app/utilities/catcher_setup.dart';

const appName = 'Ebeasiswa App';

void runEbeasiswaApp() async {
  usePathUrlStrategy();
  await GetStorage.init();
  await _firebaseSetup();
  await _setupOneSignal();
  Catcher(
    rootWidget: EbeasiswaApp(),
    debugConfig: CatcherSetup.debug(),
    releaseConfig: CatcherSetup.release(),
    profileConfig: CatcherSetup.debug(),
  );
}

Future<void> _firebaseSetup() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}

Future<void> _setupOneSignal() async {
  final c = Get.put(NotificationController(), permanent: true);
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("01a913d7-1c1a-46c0-aa15-c42ff9c575bf");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    c.sendingDataNotification(
        event.notification.notificationId,
        event.notification.title,
        event.notification.body,
        event.notification.additionalData!["user"],
        event.notification.additionalData!["read"],
        event.notification.smallIcon,
        event.notification.bigPicture);
    c.cekUnreadNotif();
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult event) {
    c.sendingDataNotification(
        event.notification.notificationId,
        event.notification.title,
        event.notification.body,
        event.notification.additionalData!["user"],
        event.notification.additionalData!["read"],
        event.notification.smallIcon,
        event.notification.bigPicture);
    navNotif(event.notification.additionalData!["route"],
        event.notification.notificationId);
    c.cekUnreadNotif();
  });
}

Future<void> navNotif(String name, String? id) async {
  switch (name) {
    case 'notif':
      Get.toNamed(RoutesName.notification);
      break;

    default:
      Get.toNamed(RoutesName.splashScreen);
  }
}

void main() {}
