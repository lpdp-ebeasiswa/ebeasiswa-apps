import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../local/box/box_storage.dart';

class PushNotifikasiServices {
  final boxstorage = BoxStorage();
  Future<dynamic> sendNotification(String token) async {
    Map data = {
      "app_id": "01a913d7-1c1a-46c0-aa15-c42ff9c575bf",
      "include_external_user_ids": [token],
      "android_accent_color": "FF9976D2",
      "small_icon": "@mipmap/ic_launcher",
      "large_icon":
          "https://awsimages.detik.net.id/visual/2020/08/13/lpdp-kemenkeu.jpeg?w=650",
      "headings": {"en": "One Signal Note"},
      "contents": {
        "en":
            "The Create Notification method is used when you want your server to programmatically send Push Notification, Email, and SMS messages through OneSignal. You may target users in one of three ways using this method:"
      },
      "data": {
        "user": "widi",
        "route": "notif",
      },
      "big_picture": ""
    };
    var bodyRequestParam = jsonEncode(data);

    return await http.Client().post(
      Uri.parse("https://onesignal.com/api/v1/notifications"),
      body: bodyRequestParam,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            "Basic MzE1OGM3YzctZWE3OC00YWMzLThiMjAtM2JmYzkzZDI3ZDk2"
      },
    ).then((http.Response response) {
      print('oneSignal ${response.statusCode} - ${response.body}');
    });
  }
}
