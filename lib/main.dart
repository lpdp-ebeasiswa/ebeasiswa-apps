import 'dart:convert';

import 'package:catcher/catcher.dart';
import 'package:ebeasiswa/ebeasiswa_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_storage/get_storage.dart';
import 'app/utilities/catcher_setup.dart';

import 'package:http/http.dart' as http;

const appName = 'Ebeasiswa App';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  // showFlutterNotification(message);
  if (notification != null && android != null) {
    var routeName = message.data['route'];
    var image = message.data['url'];
    int id = notification.hashCode;
    String? title = notification.title;
    String? body = notification.body;
    String? info = "BACKGROUND MAIN";
    await showNotifLocal(info, id, title!, body!, image, routeName);
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  isFlutterLocalNotificationsInitialized = true;
}

Future<void> showNotifLocal(String info, int id, String title, String body,
    String image, String route) async {
  BigPictureStyleInformation? bigPictureStyleInformation;
  if (image != '') {
    final http.Response response = await http.get(Uri.parse(image));
    bigPictureStyleInformation = BigPictureStyleInformation(
      ByteArrayAndroidBitmap.fromBase64String(base64Encode(response.bodyBytes)),
      largeIcon: ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes)),
    );
  }
  // Get.toNamed(route);
  flutterLocalNotificationsPlugin.show(
    id,
    '$title - $info',
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
          channelDescription: channel.description,
          icon: '@mipmap/ic_launcher',
          importance: Importance.high,
          playSound: true,
          color: Colors.orange,
          styleInformation: bigPictureStyleInformation),
    ),
  );
}

void runEbeasiswaApp() async {
  usePathUrlStrategy();
  await GetStorage.init();
  await _firebaseSetup();
  Catcher(
    rootWidget: const EbeasiswaApp(),
    debugConfig: CatcherSetup.debug(),
    releaseConfig: CatcherSetup.release(),
    profileConfig: CatcherSetup.debug(),
  );
}

Future<void> _firebaseSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setupFlutterNotifications();
}

void main() {}
